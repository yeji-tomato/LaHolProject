package com.kh.lahol.common.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.common.model.dao.CartDao;
import com.kh.lahol.common.model.vo.Cart;
import com.kh.lahol.common.model.vo.Coupon;

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
	}
}
