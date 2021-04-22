package com.kh.lahol.mypage.partner.model.service;

import java.util.List;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.partner.model.vo.Ad;
import com.kh.lahol.mypage.partner.model.vo.CoffeeClass;
import com.kh.lahol.mypage.partner.model.vo.Payment;
import com.kh.lahol.mypage.partner.model.vo.Search;
import com.kh.lahol.mypage.partner.model.vo.StoreStats;

public interface pMypageService {

	Member selectMember(Member m);

	int deleteMember(String id);

	int updateMember(Member m);

	int insertAd(Ad ad);

	int insertPayment(Payment pay);

	int adListCount(String id);

	List<Ad> selectAdList(String id, PageInfo pi);

	Ad selectAdByCode(String ad_code);

	int updateAd(Ad ad);

	int classListCount(String id);

	List<CoffeeClass> selectClassList(String id, PageInfo pi);

	int selectClassMemberCount(String class_no);

	List<Member> selectClassMember(String class_no, PageInfo pi);

	CoffeeClass selectClassByNo(String class_no);

	int payStoreListCount(String id);

	List<StoreStats> selectPayStoreList(String id, PageInfo pi);

	int selectSumPayStore(String id, String category);

	int searchPayStoreCount(Search search);

	List<StoreStats> searchPayStoreList(Search search, PageInfo pi);

	int searchSumPayStore(Search search, String category);

}
