package com.kh.lahol.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.member.model.dao.MemberDao;
import com.kh.lahol.member.model.vo.Cafe;
import com.kh.lahol.member.model.vo.M_Partner;
import com.kh.lahol.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		return null;
	}

	@Override
	public Member selectMember(String userId) {
		return mDao.selectMember(userId);
	}

	// 일반회원가입
	@Override
	public int insertnMember(Member m) {
		return mDao.insertnMember(m);
	}

	@Override
	public Member selectMemberByNickname(String nickname) {
		return mDao.selectMemberByNickname(nickname);
	}

	@Override
	public int insertpMember(M_Partner m) {
		int result = mDao.insertpMember(m);
		
		if(result > 0) {
			return mDao.insertpMember2(m);
		} else {
			return 0;
		}
	}

	@Override
	public int insertCafe(Cafe c) {
		return mDao.insertCafe(c);
	}

}
