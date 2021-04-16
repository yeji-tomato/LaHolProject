package com.kh.lahol.mypage.partner.model.dao;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.partner.model.vo.Ad;
import com.kh.lahol.mypage.partner.model.vo.Payment;

public interface pMypageDao {

	Member selectMember(Member m, String query);

	int deleteMember(String id);

	int updateMember(Member m);

	int insertAd(Ad ad);

	int insertPayment(Payment pay);

}
