package com.kh.lahol.cafe.user.model.dao;

import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.cafe.user.model.vo.CoffeeCart;
import com.kh.lahol.cafe.user.model.vo.CoffeeOrder;
import com.kh.lahol.cafe.user.model.vo.CoffeeRes;

public interface CafeDao {
	// 1. 카페 매장 예약 insert
	int hereInsertRes(CafeRes r);
	// 2. 카페 포장 예약 insert
	int togoInsertRes(CafeRes r);
	// 3. 카페 검색 전 리스트
	List<Cafe> cafeMainList();
	// 4. 카페 디테일
	public Cafe searchDetail(String caCode);
	
	List<Coffee> coffeeBeverage(String caCode);
	
	CafeRes hereTogoInfo(String id);
	
	int coResInsert(CoffeeRes coRes);
	
	List<CoffeeCart> coResBasket(CoffeeCart coCart);
	
	List<CoffeeCart> coffeeOrder(String caResNo);

}
