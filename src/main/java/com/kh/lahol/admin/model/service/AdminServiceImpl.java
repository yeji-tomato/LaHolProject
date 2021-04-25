package com.kh.lahol.admin.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.admin.model.dao.AdminDao;
import com.kh.lahol.admin.model.vo.CafeList;
import com.kh.lahol.admin.model.vo.Promotion;
import com.kh.lahol.admin.model.vo.Report_N;
import com.kh.lahol.admin.model.vo.Report_P;
import com.kh.lahol.member.model.vo.Coupon;
import com.kh.lahol.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<Member> selectNormalList() {	
		return adminDao.selectNormalList();
	}

	@Override
	public List<Member> selectPartnerList() {
		return adminDao.selectPartnerList();
	}

	@Override
	public List<Coupon> selectCouponByDate(String date) {
		return adminDao.selectCouponByDate(date);
	}

	@Override
	public List<Coupon> selectCouponByTerm(Map<String, Object> dates) {
		return adminDao.selectCouponByTerm(dates);
	}

	@Override
	public List<Promotion> selectAdWaitingList() {
		return adminDao.selectAdWaitingList();
	}

	@Override
	public List<Promotion> selectAdConfirmedList() {
		return adminDao.selectAdConfirmedList();
	}

	@Override
	public List<CafeList> selectCafeList(String date) {
		return adminDao.selectCafeList(date);
	}

	@Override
	public void updateAdConfirmed(String adCode) {
		adminDao.updateAdConfirmed(adCode);
	}

	@Override
	public void updateAdRejected(Promotion p) {
		adminDao.updateAdRejected(p);
	}

	@Override
	public List<Report_P> selectReportedPartnerList() {
		return adminDao.selectReportedPartnerList();
	}

	@Override
	public List<Report_P> selectCompletedPartnerList() {
		return adminDao.selectCompletedPartnerList();
	}


	@Override
	public List<Report_N> selectReportedUserList() {
		return adminDao.selectReportedUserList();
	}

	@Override
	public List<Report_N> selectCompletedUserList() {
		return adminDao.selectCompletedUserList();
	}

	@Override
	public void updateReportStatus(Report_P ap) {
		adminDao.updateReportStatus(ap);
	}

	@Override
	public void updatePartnerWarned(Report_P ap) {
		adminDao.updatePartnerWarned(ap);
	}

	@Override
	public void updatePartnerReportInvalid(Report_P ap) {
		adminDao.updatePartnerReportInvalid(ap);
	}


}
