package com.multi.multigg.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.multigg.model.dto.RecommendDto;
import com.multi.multigg.model.dto.RecommendUpdateDto;

@Repository
public class RecommendDaoImpl implements RecommendDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int[] commentRecommend(RecommendDto recommenddto) {
		int[] recommend = new int[2];
		
		// 추천한 적이 있는지 없는지 데이터베이스에서 값을 가져온다		
		RecommendDto dto = sqlSession.selectOne(NAMESPACE+"selectOne",recommenddto);
		//처음 추천한거면 데이터베이스를 만들어서 저장하고 추천한 적이 있으면 업데이트해준다
		if(dto != null) {
			sqlSession.update(NAMESPACE+"update",recommenddto);
		}else {
			sqlSession.insert(NAMESPACE+"insert",recommenddto);
		}
		
		//총추천수를 카운트해아 저장해준다
		int good = sqlSession.selectOne(NAMESPACE+"countGood",recommenddto);
		int bad = sqlSession.selectOne(NAMESPACE+"countBad",recommenddto);
		
		
		//COMMENT테이블에 추천수를 저장해준다
		int commentno = recommenddto.getCommentno();
		
		RecommendUpdateDto goodDto = new RecommendUpdateDto(commentno,good);
		RecommendUpdateDto badDto = new RecommendUpdateDto(commentno,bad);
		
		
		sqlSession.update(NAMESPACE+"updategood",goodDto);
		sqlSession.update(NAMESPACE+"updatebad",badDto);
		
		return recommend;
	}

}
