package com.kh.lahol.cafe.bus.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.bus.model.vo.Order;
import com.kh.lahol.cafe.bus.model.vo.PageInfo;
import com.kh.lahol.cafe.user.model.vo.CafeRes;

@Repository
public class CafeBizDaoImpl implements CafeBizDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCafeInfo(Cafe c) {
		return sqlSession.insert("cafeMapper.insertCafeInfo", c);
	}

	@Override
	public List<Cafe> selectCafeList(String Id) {
		return sqlSession.selectList("cafeMapper.selectCafeList", Id);
	}

	@Override
	public Cafe selectCafeInfo(String caCode) {
		return sqlSession.selectOne("cafeMapper.selectCafeInfo", caCode);
	}

	@Override
	public int updateCafeInfo(Cafe c) {
		return sqlSession.update("cafeMapper.updateCafeInfo", c);
	}

	@Override
	public List<Coffee> selectCoffeeList(PageInfo pi, String caCode) {
		int offset = (pi.getCurrentPage() - 1) * pi.getCoffeeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getCoffeeLimit());
		return sqlSession.selectList("cafeMapper.selectCoffeeList", caCode, rowBounds);
	}

	@Override
	public Cafe caWriteSelect(String Id) {
		return sqlSession.selectOne("cafeMapper.selectCafeWrite", Id);
	}

	@Override
	public int insertCoffee(Coffee co) {
		return sqlSession.insert("cafeMapper.insertCoffee", co);
	}

	@Override
	public Coffee selectCoffeeInfo(String cfNo) {
		return sqlSession.selectOne("cafeMapper.selectCoffeeInfo", cfNo);
	}

	@Override
	public int updateCoffeInfo(Coffee co) {
		return sqlSession.update("cafeMapper.updateCoffeInfo", co);
	}

	@Override
	public int coffeeDelete(String cfNo) {
		return sqlSession.delete("cafeMapper.coffeeDelete", cfNo);
	}

	@Override
	public int cafeDelete(String caCode) {
		return sqlSession.update("cafeMapper.cafeDelete", caCode);
	}

	@Override
	public int selectCoffeeCount(String caCode) {
		return sqlSession.selectOne("cafeMapper.cafeCoffeeCount", caCode);
	}

	@Override
	public List<CafeRes> selectCafeResList(String id) {
		return sqlSession.selectList("cafeMapper.selectCafeResList", id);
	}

	@Override
	public List<CafeRes> selectOrderList(String id) {
		return sqlSession.selectList("cafeMapper.selectOrderList", id);
	}

	@Override
	public int coffeeStatus(CafeRes cr) {
		return sqlSession.update("cafeMapper.coffeeStatus", cr);
	}
	

	@Override
	public int selectOrderCount(Order ord) {
		System.out.println(ord);
		return sqlSession.selectOne("cafeMapper.selectOrderCount", ord);
	}


	@Override
	public List<CafeRes> orderDate(Order ord, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getCoffeeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getCoffeeLimit());
		return sqlSession.selectList("cafeMapper.orderDate", ord, rowBounds);
	}



}
