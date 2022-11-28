package com.multi.multigg.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.multigg.model.dao.RecommendDao;
import com.multi.multigg.model.dto.RecommendDto;

@Service
public class RecommendBizImpl implements ReccomendBiz{

	@Autowired
	private RecommendDao recommendDao;
	
	@Override
	public int[] commentRecommend(RecommendDto recommenddto) {
		return recommendDao.commentRecommend(recommenddto);
	}

}
