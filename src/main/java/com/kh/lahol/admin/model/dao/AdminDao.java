package com.kh.lahol.admin.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kh.lahol.admin.model.vo.Promotion;
import com.kh.lahol.member.model.vo.Coupon;
import com.kh.lahol.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectNormalList();
	
	List<Member> selectPartnerList();

	List<Coupon> selectCouponByDate(String date);
	
	List<Coupon> selectCouponByTerm(Map<String, Object> dates);

	List<Promotion> selectAdWaitingList();

	List<Promotion> selectAdConfirmedList();
}
