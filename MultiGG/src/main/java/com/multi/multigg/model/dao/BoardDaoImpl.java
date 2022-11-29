package com.multi.multigg.model.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.multi.multigg.model.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardDto> selectList(int page) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", page*9);
		} catch (Exception e) {
			System.out.println("[error] : select list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BoardDto selectOne(int boardno) {
		BoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", boardno);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("[error] update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int boardno) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", boardno);
		} catch (Exception e) {
			System.out.println("[error] delete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<BoardDto> searchList(Map<String, Object> map) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			if(map.containsKey("page")) {
				int page = Integer.parseInt(map.get("page")+"")*9;
				map.put("page", page);
				list = sqlSession.selectList(NAMESPACE+"searchList", map);
			}
		} catch (Exception e) {
			System.out.println("[error] : search list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String[] saveFile(String path, MultipartFile[] uploadFile) {
        String[] fileNameArr = new String[uploadFile.length];
        
        for(int i=0; i<uploadFile.length; i++) {
        	MultipartFile multipartFile = uploadFile[i];
        	fileNameArr[i] = multipartFile.getOriginalFilename();
            
            String uploadFileName = multipartFile.getOriginalFilename();
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            
            System.out.println(multipartFile.getOriginalFilename()+" "+multipartFile.getSize()+"byte");
            
            File saveFile = new File(path, uploadFileName);
            
            try {
                multipartFile.transferTo(saveFile);
            }catch (Exception e) {
            	System.out.println(e.getMessage());
            }
        }
        return fileNameArr;
	}

	@Override
	public List<BoardDto> kategorieList(Map<String, Object> map) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			if(map.containsKey("page")) {
				int page = Integer.parseInt(map.get("page")+"")*9;
				map.put("page", page);
				list = sqlSession.selectList(NAMESPACE+"kategorieList", map);
			}
		} catch (Exception e) {
			System.out.println("[error] : kategorie list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int likeCnt(int boardno) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"likeCnt", boardno);
		} catch (Exception e) {
			System.out.println("[error] : likeCnt");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public Date likeMember(Map<String, Object> map) {
		Date res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"likeMember", map);
		} catch (Exception e) {
			System.out.println("[error] : likeMember");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertLike(Map<String, Object> map) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertLike", map);
		} catch (Exception e) {
			System.out.println("[error] : insertLike");
			e.printStackTrace();
		}
		
		return res;
	}
}
