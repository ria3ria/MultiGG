package com.multi.multigg;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@PropertySource("classpath:riot-token.properties")
public class SummonerController {
	
	@Autowired
	Environment env;
	
	@RequestMapping("/getBySummonerName.do")
	public String getBySummonerName(Model model, String summonername) {
		final String URL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/lol";
		final String USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36";
		final String ACCEPT_LANGUAGE = "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7";
		final String ACCEPT_CHARSET = "application/x-www-form-urlencoded; charset=UTF-8";
		final String ORIGIN = "https://developer.riotgames.com";
		final String X_RIOT_TOKEN = env.getProperty("token");
		
		try {
			URL url = new URL(URL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

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

			String response = stringBuffer.toString();
			model.addAttribute("res", response);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		return "recode";
	}
}
