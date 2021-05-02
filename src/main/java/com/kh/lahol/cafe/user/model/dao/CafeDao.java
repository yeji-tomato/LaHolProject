package com.kh.lahol.cafe.user.model.dao;

import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.bus.model.vo.PageInfo;
import com.kh.lahol.cafe.user.model.vo.CaReview;
import com.kh.lahol.cafe.user.model.vo.CafeQnA;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.cafe.user.model.vo.CoffeeCart;
import com.kh.lahol.cafe.user.model.vo.CoffeeOrder;
import com.kh.lahol.cafe.user.model.vo.CoffeeRes;
import com.kh.lahol.common.model.vo.Report;
import com.kh.lahol.mypage.normal.model.vo.CafeReview;
import com.kh.lahol.store.model.vo.Search;

public interface CafeDao {
	// 1. 카페 매장 예약 insert
	int hereInsertRes(CafeRes r);
	// 2. 카페 포장 예약 insert
	int togoInsertRes(CafeRes r);
	// 3. 카페 검색 전 리스트
	List<Cafe> cafeMainList(PageInfo pi);
	// 4. 카페 디테일
	public Cafe searchDetail(String caCode);
	
	List<Coffee> coffeeBeverage(String caCode);
	
	CafeRes hereTogoInfo(String id);
	
	int coResInsert(CoffeeRes coRes);
	
	List<CoffeeCart> coResBasket(CoffeeCart coCart);
	
	List<CoffeeCart> coffeeOrder(String caResNo);
	
	int cafeReport(Report rep);
	
	List<Cafe> cafeSearch(Search search);
	
	int reviewCount(String caCode);
	
	List<CaReview> selectReviewList(String caCode, PageInfo pi);
	
	int cafeQask(CafeQnA cq);
	
	List<CafeQnA> selectQnAList(String caCode);
	
	int cafeUserReport(Report rep);
	
	int mainCount();
	
	List<CafeRes> isUseResList(String caCode);

}
