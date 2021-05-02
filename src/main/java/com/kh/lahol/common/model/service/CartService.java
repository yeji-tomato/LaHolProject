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
	// 클래스 카트
	int classcartInsert(Cart ct);
	
	int insertClOrder(String classNo);


	int cartNum(String id);



	//장바구니 삭제
	int deleteCart(String sT);



	
	int successCart(String id);

	//제품 결제시 카드에서 삭제
	int deleteCart1(String purchaseNo);

	int deleteCart2(String cres);

	int deleteCart3(String classNo);


}
