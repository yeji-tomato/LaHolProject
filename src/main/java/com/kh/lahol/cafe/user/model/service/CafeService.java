package com.kh.lahol.cafe.user.model.service;

import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.cafe.user.model.vo.CoffeeRes;

public interface CafeService {
	// 1. 카페 매장 예약 insert
	public int hereInsertRes(CafeRes r);
	// 2. 카페 포장 예약 insert
	public int togoInsertRes(CafeRes r);
	// 3. 검색 전 카페 리스트 출력
	public List<Cafe> cafeMainList();
	// 4. 카페 디테일 보기
	public Cafe searchDetail(String caCode);
	
	public List<Coffee> coffeeBeverage(String caCode);
	// 매장 또는 포장 정보 가지고 오기
	public CafeRes hereTogoInfo(String id);
	// 커피 예약 insert
	public int coResInsert(CoffeeRes coRes);
	// 커피 basket
	public List<CoffeeRes> coResBasket(String id);

}
