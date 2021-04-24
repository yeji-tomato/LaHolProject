package com.kh.lahol.cafe.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.cafe.user.model.vo.CoffeeCart;
import com.kh.lahol.cafe.user.model.vo.CoffeeOrder;
import com.kh.lahol.cafe.user.model.vo.CoffeeRes;
import com.kh.lahol.common.model.vo.Report;

@Repository
public class CafeDaoImpl implements CafeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int hereInsertRes(CafeRes r) {
		return sqlSession.insert("cafeMapper.insertHereRes", r);
	}

	@Override
	public int togoInsertRes(CafeRes r) {
		return sqlSession.insert("cafeMapper.insertTogoRes", r);
	}

	@Override
	public List<Cafe> cafeMainList() {
		return sqlSession.selectList("cafeMapper.cafeMainList");
	}

	@Override
	public Cafe searchDetail(String caCode) {
		return sqlSession.selectOne("cafeMapper.searchCafeDetail", caCode);
	}

	@Override
	public List<Coffee> coffeeBeverage(String caCode) {
		return sqlSession.selectList("cafeMapper.coffeeBeverage", caCode);
	}

	@Override
	public CafeRes hereTogoInfo(String id) {
		return sqlSession.selectOne("cafeMapper.hereTogoInfo", id);
	}

	@Override
	public int coResInsert(CoffeeRes coRes) {
		return sqlSession.insert("cafeMapper.coResInsert", coRes);
	}


	@Override
	public List<CoffeeCart> coResBasket(CoffeeCart coCart) {
		return sqlSession.selectList("cafeMapper.coResBasket", coCart);
	}

	@Override
	public List<CoffeeCart> coffeeOrder(String caResNo) {
		return sqlSession.selectList("cafeMapper.coOrder", caResNo);
	}

	@Override
	public int cafeReport(Report rep) {
		return sqlSession.insert("cafeMapper.cafeReport", rep);
	}

}
