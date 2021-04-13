package com.kh.lahol.mypage.normal.model.dao;

import com.kh.lahol.member.model.vo.Member;

public interface nMypageDao {

	int updateMember(Member m);

	Member selectMember(Member m, String query);

	int deleteMember(String id);

}
