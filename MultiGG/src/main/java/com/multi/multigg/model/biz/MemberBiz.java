package com.multi.multigg.model.biz;

import com.multi.multigg.model.dto.MemberDto;

public interface MemberBiz {
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
}
