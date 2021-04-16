package com.kh.lahol.mypage.partner.model.service;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.partner.model.vo.Ad;
import com.kh.lahol.mypage.partner.model.vo.Payment;

public interface pMypageService {

	Member selectMember(Member m);

	int deleteMember(String id);

	int updateMember(Member m);

	int insertAd(Ad ad);

	int insertPayment(Payment pay);

}
