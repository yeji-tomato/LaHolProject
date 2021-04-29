package com.kh.lahol.admin.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.admin.model.dao.AdminDao;
import com.kh.lahol.admin.model.vo.CafeList;
import com.kh.lahol.admin.model.vo.Game;
import com.kh.lahol.admin.model.vo.Profit;
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
	
	@Override
	public List<CafeList> selectCafeListByTerm(Map<String, Object> dates) {
		return adminDao.selectCafeListByTerm(dates);
	}

	@Override
	public void updateUserWarned(Report_N an) {
		adminDao.updateUserWarned(an);
	}

	@Override
	public void updateUserReportStatus(Report_N an) {
		adminDao.updateUserReportStatus(an);
	}

	@Override
	public void updateUserReportInvalid(Report_N an) {
		adminDao.updateUserReportInvalid(an);
	}

	@Override
	public List<Profit> selectProfitByDate(String date) {
		return adminDao.selectProfitByDate(date);
	}

	@Override
	public void insertCouponToUser(Game gm) {
		 adminDao.insertCouponToUser(gm);
	}

	@Override
	public String selectWeeklySales(int i) {
		return adminDao.selectWeeklySales(i);
	}

	@Override
	public String selectMonthlySales(String i) {
		return adminDao.selectMonthlySales(i);
	}

	@Override
	public String selectYearlySales(String s) {
		return adminDao.selectYearlySales(s);
	}


}
