package com.multi.multigg.model.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
		System.out.println(dto.toString());
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
	public List<BoardDto> searchList(String keyword) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"searchList", keyword);
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
}
