package com.kh.lahol.common.model.service;

import java.util.List;

import com.kh.lahol.common.model.vo.Cart;
import com.kh.lahol.common.model.vo.Coupon;
import com.kh.lahol.common.model.vo.Payment;

public interface CartService {

	// 장바구니에 카페 정보 insert
	int cafeCartInsert(Cart cart);

	List<Cart> cartSelectList(String id);

	List<Coupon> couponSelectList(String id);

	int cafeCartPayment(Payment pay);


	//스토어 카트
	int storeCartInsert(Cart ct);
	
 

	int couponUse(Coupon cop);
	//스토어 결제
	int CartPayment(Payment pay);
 
	//커피 결제
	int CartPayment2(Payment pay);

	//클래스 결제
	int CartPayment3(Payment pay);
	
	
	int successCart(String id);


	int cartNum(String id);

	// 클래스 카트
	int classcartInsert(Cart ct);

	//장바구니 삭제
	int deleteCart(String sT);

	int insertClOrder(String classNo);

	



}
