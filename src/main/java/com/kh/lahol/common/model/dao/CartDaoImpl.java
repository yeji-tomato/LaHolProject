package com.kh.lahol.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.common.model.vo.Cart;

@Repository
public class CartDaoImpl implements CartDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int cafeCartInsert(Cart cart) {
		System.out.println("dao : "+ cart);
		return sqlSession.insert("cartMapper.insertCafeCart", cart);
	}

	@Override
	public List<Cart> cartSelectList(String id) {
		return sqlSession.selectList("cartMapper.cartSelectList", id);
	}

}
