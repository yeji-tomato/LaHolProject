package com.kh.lahol.member.model.service;

import com.kh.lahol.member.model.vo.Member;

public interface MemberService {
	
	public Member loginMember(Member m);
	
	// 아이디로 member selectOne
	public Member selectMember(String userId);

	// 일반회원가입
	public int insertnMember(Member m);

	// 닉네임 중복확인
	public Member selectMemberByNickname(String nickname);
}
