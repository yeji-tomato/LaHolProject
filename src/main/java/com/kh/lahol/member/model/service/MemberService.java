package com.kh.lahol.member.model.service;

import com.kh.lahol.member.model.vo.Cafe;
import com.kh.lahol.member.model.vo.M_Partner;
import com.kh.lahol.member.model.vo.Member;

public interface MemberService {
	
	public Member loginMember(Member m);
	
	// 아이디로 member selectOne
	public Member selectMember(String userId);

	// 일반회원가입
	public int insertnMember(Member m);

	// 닉네임 중복확인
	public Member selectMemberByNickname(String nickname);

	// 사업자 회원가입
	public int insertpMember(M_Partner m);

	// 사업자 회원가입 시 카페 정보 입력
	public int insertCafe(Cafe c);

	// 아이디 찾기
	public Member idSearch(Member m);

	// 비밀번호 찾기
	public Member pwdSearch(Member m);

	// 임시비밀번호 발급
	public int updatePwd(Member m);

	// 이메일 발송
	public String sendEmail(Member m, String div);

}
