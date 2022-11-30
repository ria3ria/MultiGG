package com.multi.multigg.model.dao;

import com.multi.multigg.model.dto.RecommendDto;

public interface RecommendDao {
	
	String NAMESPACE = "recommend.";
	
	public int[] commentRecommend(RecommendDto dto);

}
