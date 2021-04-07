package com.kh.lahol.member.model.dao;

import com.kh.lahol.member.model.vo.Member;

public interface MemberDao {
	
	public Member loginMember(Member m);

	public Member selectMember(String userId);

	public int insertnMember(Member m);

	public Member selectMemberByNickname(String nickname);
}
