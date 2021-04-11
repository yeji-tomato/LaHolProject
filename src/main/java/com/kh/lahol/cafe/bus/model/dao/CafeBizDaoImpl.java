package com.kh.lahol.cafe.bus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;

@Repository
public class CafeBizDaoImpl implements CafeBizDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCafeInfo(Cafe c) {
		return sqlSession.insert("cafeMapper.insertCafeInfo", c);
	}

	/*
	 * @Override public int insetCafeInfoPhoto(ArrayList<Caphoto> photoList) {
	 * System.out.println("photoListDao : " + photoList); return
	 * sqlSession.update("cafeMapper.insertCafePhotoInfo", photoList); }
	 */

	

}
