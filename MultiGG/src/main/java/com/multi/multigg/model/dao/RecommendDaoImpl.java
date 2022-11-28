package com.multi.multigg.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.multigg.model.dto.RecommendDto;

@Repository
public class RecommendDaoImpl implements RecommendDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int[] commentRecommend(RecommendDto recommenddto) {
		int[] recommend = new int[2];
		
		
		RecommendDto dto = sqlSession.selectOne(NAMESPACE+"selectOne",recommenddto);
		
		System.out.println(dto);
		System.out.println(recommenddto.getMembernickname());
		if(dto != null) {
			sqlSession.update(NAMESPACE+"update",recommenddto);
		}else {
			sqlSession.insert(NAMESPACE+"insert",recommenddto);
		}
		recommend[0] = sqlSession.selectOne(NAMESPACE+"countGood",recommenddto);
		recommend[1] = sqlSession.selectOne(NAMESPACE+"countBad",recommenddto);
		
		
		return recommend;
	}

}
