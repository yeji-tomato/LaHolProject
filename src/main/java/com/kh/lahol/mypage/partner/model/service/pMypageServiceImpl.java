package com.kh.lahol.mypage.partner.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.partner.model.dao.pMypageDao;
import com.kh.lahol.mypage.partner.model.vo.Ad;
import com.kh.lahol.mypage.partner.model.vo.Payment;

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

	@Override
	public int insertAd(Ad ad) {
		return pDao.insertAd(ad);
	}

	@Override
	public int insertPayment(Payment pay) {
		return pDao.insertPayment(pay);
	}

	@Override
	public int adListCount(String id) {
		return pDao.adListCount(id);
	}

	@Override
	public List<Ad> selectAdList(String id, PageInfo pi) {
		return pDao.selectAdList(id, pi);
	}

}
