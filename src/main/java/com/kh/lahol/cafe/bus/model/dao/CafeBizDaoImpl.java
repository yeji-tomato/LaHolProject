package com.kh.lahol.cafe.bus.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;
import com.kh.lahol.cafe.bus.model.vo.Coffee;

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
	public List<Coffee> selectCoffeeList(String caCode) {
		return sqlSession.selectList("cafeMapper.selectCoffeeList", caCode);
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


	

}
