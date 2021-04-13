package com.kh.lahol.mypage.partner.model.dao;

import com.kh.lahol.member.model.vo.Member;

public interface pMypageDao {

	Member selectMember(Member m, String query);

	int deleteMember(String id);

	int updateMember(Member m);

}
