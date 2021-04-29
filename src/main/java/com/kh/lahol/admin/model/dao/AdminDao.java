package com.kh.lahol.admin.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kh.lahol.admin.model.vo.CafeList;
import com.kh.lahol.admin.model.vo.Game;
import com.kh.lahol.admin.model.vo.Profit;
import com.kh.lahol.admin.model.vo.Promotion;
import com.kh.lahol.admin.model.vo.Report_N;
import com.kh.lahol.admin.model.vo.Report_P;
import com.kh.lahol.member.model.vo.Coupon;
import com.kh.lahol.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectNormalList();
	
	List<Member> selectPartnerList();

	List<Coupon> selectCouponByDate(String date);
	
	List<Coupon> selectCouponByTerm(Map<String, Object> dates);

	List<Promotion> selectAdWaitingList();

	List<Promotion> selectAdConfirmedList();

	List<CafeList> selectCafeList(String date);
	
	void updateAdConfirmed(String adCode);
	
	void updateAdRejected(Promotion p);
	
	List<Report_P> selectReportedPartnerList();
	
	List<Report_P> selectCompletedPartnerList();
	
	void updatePartnerWarned(Report_P ap);
	
	void updateReportStatus(Report_P ap);
	
	List<Report_N> selectReportedUserList();
	
	List<Report_N> selectCompletedUserList();
	
	void updatePartnerReportInvalid(Report_P ap); 
	
	List<CafeList> selectCafeListByTerm(Map<String, Object> dates);
	
	void updateUserWarned(Report_N an);
	
	void updateUserReportStatus(Report_N an);
	
	void updateUserReportInvalid(Report_N an);
	
	List<Profit> selectProfitByDate(String date);
	
	void insertCouponToUser(Game gm);

	String selectWeeklySales(int i);

	String selectMonthlySales(String i);

	String selectYearlySales(String s);
}
