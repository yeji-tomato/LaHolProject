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
	public List<Cafe> selectCafeList() {
		return sqlSession.selectList("cafeMapper.selectCafeList");
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

	/*
	 * @Override public int insetCafeInfoPhoto(ArrayList<Caphoto> photoList) {
	 * System.out.println("photoListDao : " + photoList); return
	 * sqlSession.update("cafeMapper.insertCafePhotoInfo", photoList); }
	 */

	

}
