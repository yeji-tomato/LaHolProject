package com.kh.lahol.coffeeclass.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.lahol.coffeeclass.model.dao.CoffeeClassDao;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;

public class CoffeeClassServiceImpl implements CoffeeClassSerivce{
	@Autowired
	private CoffeeClassDao clDao;

	// 조회
	@Override
	public int selectListCount() {
		return clDao.selectListCount();
	}

	@Override
	public List<CoffeeClass> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertClass(CoffeeClass cl) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CoffeeClass selectCoffeeClass(int clid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateClass(CoffeeClass cl) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteClass(int clid) {
		// TODO Auto-generated method stub
		return 0;
	}

}
