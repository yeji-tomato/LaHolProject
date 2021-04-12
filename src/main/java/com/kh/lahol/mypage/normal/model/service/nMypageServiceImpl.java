package com.kh.lahol.mypage.normal.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.normal.model.dao.nMypageDao;

@Service
public class nMypageServiceImpl implements nMypageService{
	@Autowired
	private nMypageDao nDao;

	@Override
	public int updateMember(Member m) {
		return nDao.updateMember(m);
	}

	@Override
	public Member selectMember(Member m) {
		String query = "";
		
		if(m.getGrade().equals("N")) {
			query = "mypageMapper.selectNormalMember";
		} else if(m.getGrade().equals("P")) {
			query = "mypageMapper.selectPartnerMember";
		} else {
			query = "mypageMapper.selectMemberById";
		}
			
		return nDao.selectMember(m, query);
	}

}
