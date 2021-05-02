package com.kh.lahol.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.common.model.vo.Cart;
import com.kh.lahol.common.model.vo.Coupon;
import com.kh.lahol.common.model.vo.Payment;

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

	@Override
	public List<Coupon> couponSelectList(String id) {
		System.out.println("dao"+id);
		return sqlSession.selectList("cartMapper.couponSelectList", id);
	}
	
	//스토어
	@Override
	public int storeCartInsert(Cart ct) {
		return sqlSession.insert("cartMapper.storeCartInsert", ct);
	}

	@Override
	public int cafeCartPayment(Payment pay) {
		return sqlSession.insert("cartMapper.cafeCartPayment", pay);
	}

	@Override
	public int couponUse(Coupon cop) {
		return sqlSession.update("cartMapper.coponUse", cop);
	}

	@Override
	public int CartPayment(Payment pay) {
		return sqlSession.insert("cartMapper.CartPayment", pay);
	}
	
	@Override
	public int CartPayment2(Payment pay) {
		return sqlSession.insert("cartMapper.CartPayment2", pay);
	}

	@Override
	public int CartPayment3(Payment pay) {
		return sqlSession.insert("cartMapper.CartPayment3", pay);
	}

	


	@Override
	public int cartNum(String id) {
		return sqlSession.selectOne("cartMapper.cartNum", id);
	}

	// 클래스 장바구니
	@Override
	public int classcartInsert(Cart ct) {
		return sqlSession.insert("cartMapper.classCart", ct);

	}

	@Override
	public int deleteCart(String sT) {
		return sqlSession.delete("cartMapper.deleteCart", sT);
	}

	@Override
	public int insertClOrder(String classNo) {
		return sqlSession.insert("cartMapper.insertClOrder", classNo);
	}

	
	
	@Override
	public int successCart(String id) {
		return sqlSession.delete("cartMapper.successCart", id);
	}

	@Override
	public int deleteCart1(String purchaseNo) {
		return sqlSession.delete("cartMapper.deleteCart1", purchaseNo);
	}

	@Override
	public int deleteCart2(String cres) {
		return sqlSession.delete("cartMapper.deleteCart2", cres);
	}

	@Override
	public int deleteCart3(String classNo) {
		return sqlSession.delete("cartMapper.deleteCart3", classNo);
	}

	
	//카트 제품 삭제
 
	

}
