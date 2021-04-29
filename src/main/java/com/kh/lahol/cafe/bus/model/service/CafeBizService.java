package com.kh.lahol.cafe.bus.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.bus.model.vo.Order;
import com.kh.lahol.cafe.bus.model.vo.PageInfo;
import com.kh.lahol.cafe.bus.model.vo.bevOrder;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.cafe.user.model.vo.CoffeeRes;

public interface CafeBizService {
	// 카페 정보 insert
	public int insertCafeInfo(Cafe c);

	// 카페 정보 목록 조회
	List<Cafe> selectCafeList(String Id);
	
	// 카페 정보 수정
	int updateCafeInfo(Cafe c);
	
	// 카페 정보 삭제
	int deleteCafeInfo(String caCode);

	// 카페 시퀀스 번호를 통한 조회
	public Cafe selectCafeInfo(String caCode);
	
	// 카페 시퀀스를 통한 커피 조회
	public List<Coffee> selectCoffeeList(PageInfo pi, String caCode);
	
	// 카페 등록을 하기 위한 select
	public Cafe caWriteSelect(String Id);
	
	// 음료 정보 insert
	public int insertCoffee(Coffee co);
	
	// 음료 정보 select
	public Coffee selectCoffeeInfo(String cfNo);

	public int updateCoffeeInfo(Coffee co);

	public int coffeeDelete(String cfNo);

	public int cafeDelete(String caCode);

	int selectCoffeeCount(String caCode);

	public List<CafeRes> selectCafeResList(String id);

	public List<CafeRes> selectOrderList(String id, PageInfo pi);

	public int coffeeStatus(CafeRes cr);

	public List<CafeRes> OrderDate(Order ord, PageInfo pi);

	public int selectOrderCount(Order ord);

	public List<bevOrder> beverageOrder(String caResNo);

	// home 페이지 등록된 카페가 존재하면 출력
	public Cafe cafeHome(String id);
	// home 제조 전
	public int countBefore(String id);

	public int countMiddle(String id);

	public int countAfter(String id);



	

}
