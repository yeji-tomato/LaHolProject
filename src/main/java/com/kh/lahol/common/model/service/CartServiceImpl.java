package com.kh.lahol.common.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.common.model.dao.CartDao;
import com.kh.lahol.common.model.vo.Cart;
import com.kh.lahol.common.model.vo.Coupon;
import com.kh.lahol.common.model.vo.Payment;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDao cartDao;
	
	@Override
	public int cafeCartInsert(Cart cart) {
		System.out.println("Service : "+ cart);
		return cartDao.cafeCartInsert(cart);

	}

	@Override
	public List<Cart> cartSelectList(String id) {
		return cartDao.cartSelectList(id);
	}

	@Override
	public List<Coupon> couponSelectList(String id) {
		return cartDao.couponSelectList(id);
	}//00

	//스토아 카트
	@Override
	public int storeCartInsert(Cart ct) {
		return cartDao.storeCartInsert(ct);
	}


	@Override
	public int cafeCartPayment(Payment pay) {
		return cartDao.cafeCartPayment(pay);
	}

	@Override
	public int couponUse(Coupon cop) {
		return cartDao.couponUse(cop);
	}

	@Override
	public int CartPayment(Payment pay) {
		return cartDao.CartPayment(pay);
	}

	@Override
	public int successCart(String id) {
		return cartDao.successCart(id);
	}

	
	// 카트 장바구니
	@Override
	public int classcartInsert(Cart ct) {
		return cartDao.classcartInsert(ct);
	}

}
