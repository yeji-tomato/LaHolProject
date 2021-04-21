package com.kh.lahol.common.model.service;

import java.util.List;

import com.kh.lahol.common.model.vo.Cart;

public interface CartService {

	// 장바구니에 카페 정보 insert
	int cafeCartInsert(Cart cart);

	List<Cart> cartSelectList(String id);

}
