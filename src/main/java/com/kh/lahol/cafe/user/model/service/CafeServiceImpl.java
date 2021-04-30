package com.kh.lahol.cafe.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.bus.model.vo.PageInfo;
import com.kh.lahol.cafe.user.model.dao.CafeDao;
import com.kh.lahol.cafe.user.model.vo.CaReview;
import com.kh.lahol.cafe.user.model.vo.CafeQnA;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.cafe.user.model.vo.CoffeeCart;
import com.kh.lahol.cafe.user.model.vo.CoffeeOrder;
import com.kh.lahol.cafe.user.model.vo.CoffeeRes;
import com.kh.lahol.common.model.vo.Report;
import com.kh.lahol.mypage.normal.model.vo.CafeReview;
import com.kh.lahol.store.model.vo.Search;

@Service
public class CafeServiceImpl implements CafeService{
	@Autowired
	private CafeDao caDao;
	
	@Override
	public int hereInsertRes(CafeRes r) {
		return caDao.hereInsertRes(r);
	}

	@Override
	public int togoInsertRes(CafeRes r) {
		return caDao.togoInsertRes(r);
	}

	@Override
	public List<Cafe> cafeMainList() {
		return caDao.cafeMainList();
	}

	@Override
	public Cafe searchDetail(String caCode) {
		return caDao.searchDetail(caCode);
	}

	@Override
	public List<Coffee> coffeeBeverage(String caCode) {
		return caDao.coffeeBeverage(caCode);
	}

	@Override
	public CafeRes hereTogoInfo(String id) {
		return caDao.hereTogoInfo(id);
	}

	@Override
	public int coResInsert(CoffeeRes coRes) {
		return caDao.coResInsert(coRes);
	}

	@Override
	public List<CoffeeCart> coResBasket(CoffeeCart coCart) {
		return caDao.coResBasket(coCart);
	}

	@Override
	public List<CoffeeCart> coffeeOrder(String caResNo) {
		return caDao.coffeeOrder(caResNo);
	}

	@Override
	public int cafeReport(Report rep) {
		return caDao.cafeReport(rep);
	}

	@Override
	public List<Cafe> cafeSearch(Search search) {
		return caDao.cafeSearch(search);
	}

	@Override
	public List<CaReview> selectReviewList(String caCode, PageInfo pi) {
		return caDao.selectReviewList(caCode, pi);
	}

	@Override
	public int reviewCount(String caCode) {
		return caDao.reviewCount(caCode);
	}

	@Override
	public int cafeQask(CafeQnA cq) {
		System.out.println("서비스 : " + cq);
		return caDao.cafeQask(cq);
	}

	@Override
	public List<CafeQnA> selectQnAList(String caCode) {
		return caDao.selectQnAList(caCode);
	}

	@Override
	public int cafeUserReport(Report rep) {
		return caDao.cafeUserReport(rep);
	}

	
	

}
