package com.kh.lahol.mypage.normal.model.service;

import java.util.List;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.normal.model.vo.Coupon;

public interface nMypageService {

	int updateMember(Member m);

	Member selectMember(Member m);

	int deleteMember(String id);

	int selectCouponCount(String id);

	List<Coupon> selectCouponList(String id, PageInfo pi);

}
