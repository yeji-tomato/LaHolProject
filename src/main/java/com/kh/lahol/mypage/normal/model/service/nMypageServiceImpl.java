package com.kh.lahol.mypage.normal.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.normal.model.dao.nMypageDao;
import com.kh.lahol.mypage.normal.model.vo.Coupon;

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

	@Override
	public int deleteMember(String id) {
		return nDao.deleteMember(id);
	}

	@Override
	public int selectCouponCount(String id) {
		return nDao.selectCouponCount(id);
	}

	@Override
	public List<Coupon> selectCouponList(String id, PageInfo pi) {
		return nDao.selectCouponList(id, pi);
	}

}
