package com.kh.lahol.mypage.partner.model.service;

import com.kh.lahol.member.model.vo.Member;

public interface pMypageService {

	Member selectMember(Member m);

	int deleteMember(String id);

	int updateMember(Member m);

}
