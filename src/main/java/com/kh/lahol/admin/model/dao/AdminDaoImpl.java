package com.kh.lahol.admin.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.admin.model.vo.Promotion;
import com.kh.lahol.member.model.vo.Coupon;
import com.kh.lahol.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectNormalList() {
		return sqlSession.selectList("adminMapper.selectNormalList");
	}

	@Override
	public List<Member> selectPartnerList() {
		return sqlSession.selectList("adminMapper.selectPartnerList");
	}
	
	@Override
	public List<Coupon> selectCouponByDate(String date){
		return sqlSession.selectList("adminMapper.selectCouponByDate",date);
	}

	@Override
	public List<Coupon> selectCouponByTerm(Map<String, Object> dates) {
		return sqlSession.selectList("adminMapper.selectCouponByTerm", dates);
	}

	@Override
	public List<Promotion> selectAdWaitingList() {
		return sqlSession.selectList("adminMapper.selectAdWaitingList");
	}

	@Override
	public List<Promotion> selectAdConfirmedList() {
		return sqlSession.selectList("adminMapper.selectAdConfirmedList");
	}



	
}
