package com.multi.multigg;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@PropertySource("classpath:riot-token.properties")
public class SummonerController {
	
	@Autowired
	Environment env;
	
	final String version = "12.22.1";
	JSONObject champion;
	JSONObject item;
	
    @ResponseBody
    @RequestMapping(value = "/getBySummonerName.do", produces = "application/text; charset=utf-8")
    public String getBySummonerName(HttpServletResponse response, String summonername) {
    	response.setCharacterEncoding("UTF-8");
    	String res = "<h2>"+summonername+" 님의 최근 10게임 정보</h2>"
    			+ "<table><tr>"
				+ "<th>결과</th>"
				+ "<th>포지션</th>"
				+ "<th>킬</th>"
				+ "<th>데스</th>"
				+ "<th>어시</th>"
				+ "<th>챔피언</th>"
				+ "<th>레벨</th>"
				+ "<th>획득 골드</th>"
				+ "<th>사용 골드</th>"
				+ "<th>아이템</th>"
				+ "<th>아이템</th>"
				+ "<th>아이템</th>"
				+ "<th>아이템</th>"
				+ "<th>아이템</th>"
				+ "<th>아이템</th>"
				+ "<th>아이템</th>"
				+ "</tr>";
    	summonername = summonername.replace(" ", "%20");
		try {
			if(champion == null) {
				loadJson(version);
			}
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(get("https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+summonername));
			String puuid = obj.get("puuid").toString();
			
			JSONArray arr = (JSONArray) parser.parse(get("https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"+puuid+"/ids?start=0&count=10"));
			for(int i=0; i<arr.size(); i++) {
				obj = (JSONObject) parser.parse(get("https://asia.api.riotgames.com/lol/match/v5/matches/"+arr.get(i)));
				JSONArray participants = (JSONArray) ((JSONObject) obj.get("info")).get("participants");
				res+="<tr>";
				for(int j=0; j<participants.size(); j++) {
					obj = ((JSONObject) participants.get(j));
					if(puuid.equals(obj.get("puuid").toString())) {
						res+= (boolean) obj.get("win") ? "<td>WIN</td>" : "<td>LOSE</td>";
						res+="<td>"+obj.get("teamPosition")+"</td>";
						res+="<td>"+obj.get("kills")+"</td>";
						res+="<td>"+obj.get("deaths")+"</td>";
						res+="<td>"+obj.get("assists")+"</td>";
						if(champion.get(obj.get("championName")) == null) {
							res+="<td>피들스틱</td>";
						}
						else {
							res+="<td>"+((JSONObject) champion.get(obj.get("championName"))).get("name")+"</td>";
						}
						res+="<td>"+obj.get("champLevel")+"</td>";
						res+="<td>"+obj.get("goldEarned")+"</td>";
						res+="<td>"+obj.get("goldSpent")+"</td>";
						for(int k=0; k<=6; k++) {
							String itemId = obj.get("item"+k).toString();
							if(itemId.equals("0")) {
								break;
							}
							res+="<td>"+((JSONObject) item.get(itemId)).get("name")+"</td>";
						}
						break;
					}
				}
				res+="</tr>";
			}
			res+= "</table>";
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(res);
		return res;
	}
	
	public String get(String url) {
		final String USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36";
		final String ACCEPT_LANGUAGE = "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7";
		final String ACCEPT_CHARSET = "application/x-www-form-urlencoded; charset=UTF-8";
		final String ORIGIN = "https://developer.riotgames.com";
		final String X_RIOT_TOKEN = env.getProperty("token");
		String response = null;
		try {
			HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();

			connection.setRequestMethod("GET");
			connection.setRequestProperty("User-Agent", USER_AGENT);
			connection.setRequestProperty("Accept-Language", ACCEPT_LANGUAGE);
			connection.setRequestProperty("Accept-Charset", ACCEPT_CHARSET);
			connection.setRequestProperty("Origin", ORIGIN);
			connection.setRequestProperty("X-Riot-Token", X_RIOT_TOKEN);

			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			StringBuffer stringBuffer = new StringBuffer();
			String inputLine;

			while ((inputLine = bufferedReader.readLine()) != null)  {
			    stringBuffer.append(inputLine);
			}
			bufferedReader.close();
			response = stringBuffer.toString();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return response;
	}
	
	public void loadJson(String version) throws ParseException {
		JSONParser parser = new JSONParser();
		champion = (JSONObject) parser.parse(get("https://ddragon.leagueoflegends.com/cdn/"+version+"/data/ko_KR/champion.json"));
		champion = (JSONObject) champion.get("data");
		item = (JSONObject) parser.parse(get("https://ddragon.leagueoflegends.com/cdn/"+version+"/data/ko_KR/item.json"));
		item = (JSONObject) item.get("data");
	}
}
