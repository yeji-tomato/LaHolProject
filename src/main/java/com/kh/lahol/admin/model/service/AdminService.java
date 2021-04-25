package com.kh.lahol.admin.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kh.lahol.admin.model.vo.CafeList;
import com.kh.lahol.admin.model.vo.Promotion;
import com.kh.lahol.admin.model.vo.Report_P;
import com.kh.lahol.member.model.vo.Coupon;
import com.kh.lahol.member.model.vo.Member;

public interface AdminService {

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
	
	void updatePartnerWarned(Map<String, Object> data);

}
