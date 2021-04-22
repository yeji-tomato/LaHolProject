package com.kh.lahol.mypage.partner.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.partner.model.dao.pMypageDao;
import com.kh.lahol.mypage.partner.model.vo.Ad;
import com.kh.lahol.mypage.partner.model.vo.CoffeeClass;
import com.kh.lahol.mypage.partner.model.vo.Payment;
import com.kh.lahol.mypage.partner.model.vo.Search;
import com.kh.lahol.mypage.partner.model.vo.StoreStats;

@Service
public class pMypageServiceImpl implements pMypageService{
	@Autowired
	private pMypageDao pDao;

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
			
		return pDao.selectMember(m, query);
	}

	@Override
	public int deleteMember(String id) {
		return pDao.deleteMember(id);
	}

	@Override
	public int updateMember(Member m) {
		return pDao.updateMember(m);
	}

	@Override
	public int insertAd(Ad ad) {
		return pDao.insertAd(ad);
	}

	@Override
	public int insertPayment(Payment pay) {
		return pDao.insertPayment(pay);
	}

	@Override
	public int adListCount(String id) {
		return pDao.adListCount(id);
	}

	@Override
	public List<Ad> selectAdList(String id, PageInfo pi) {
		return pDao.selectAdList(id, pi);
	}

	@Override
	public Ad selectAdByCode(String ad_code) {
		return pDao.selectAdByCode(ad_code);
	}

	@Override
	public int updateAd(Ad ad) {
		return pDao.updateAd(ad);
	}

	@Override
	public int classListCount(String id) {
		return pDao.classListCount(id);
	}

	@Override
	public List<CoffeeClass> selectClassList(String id, PageInfo pi) {
		return pDao.selectClassList(id, pi);
	}

	@Override
	public int selectClassMemberCount(String class_no) {
		return pDao.selectClassMemberCount(class_no);
	}

	@Override
	public List<Member> selectClassMember(String class_no, PageInfo pi) {
		return pDao.selectClassMember(class_no, pi);
	}

	@Override
	public CoffeeClass selectClassByNo(String class_no) {
		return pDao.selectClassByNo(class_no);
	}

	@Override
	public int payStoreListCount(String id) {
		return pDao.payStoreListCount(id);
	}

	@Override
	public List<StoreStats> selectPayStoreList(String id, PageInfo pi) {
		return pDao.selectPayStoreList(id, pi);
	}

	@Override
	public int selectSumPayStore(String id, String category) {
		List<String> list = new ArrayList<>();
		list.add(id);
		list.add(category);
		return pDao.selectSumPayStore(list);
	}

	@Override
	public int searchPayStoreCount(Search search) {
		return pDao.searchPayStoreCount(search);
	}

	@Override
	public List<StoreStats> searchPayStoreList(Search search, PageInfo pi) {
		return pDao.searchPayStoreList(search, pi);
	}

	@Override
	public int searchSumPayStore(Search search, String category) {
		List<Object> list = new ArrayList<>();
		list.add(search);
		list.add(category);
		return pDao.searchSumPayStore(list);
	}

}
