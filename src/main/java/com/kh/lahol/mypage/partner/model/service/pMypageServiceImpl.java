package com.kh.lahol.mypage.partner.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.partner.model.dao.pMypageDao;

@Service
public class pMypageServiceImpl implements pMypageService{
	@Autowired
	private pMypageDao pDao;

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
			
		return pDao.selectMember(m, query);
	}

	@Override
	public int deleteMember(String id) {
		return pDao.deleteMember(id);
	}

	@Override
	public int updateMember(Member m) {
		return pDao.updateMember(m);
	}

}
