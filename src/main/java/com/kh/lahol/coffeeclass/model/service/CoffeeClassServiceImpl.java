package com.kh.lahol.coffeeclass.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.coffeeclass.model.dao.CoffeeClassDao;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;

@Service
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
		return clDao.selectList(pi);
	}

	@Override
	public int insertClass(CoffeeClass cl) {
		System.out.println("service : " + cl);
		return clDao.insertClass(cl);
	}

	@Override
	public CoffeeClass selectCoffeeClass(String classNo) {
		return clDao.selectCoffeeClass(classNo);
	}


	@Override
	public int updateClass(CoffeeClass cl) {
		return clDao.updateClass(cl);
	}

	@Override
	public int deleteClass(int classNo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
