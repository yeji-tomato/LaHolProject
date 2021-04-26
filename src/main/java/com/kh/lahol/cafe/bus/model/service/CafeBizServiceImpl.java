package com.kh.lahol.cafe.bus.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.cafe.bus.model.dao.CafeBizDao;
import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.bus.model.vo.PageInfo;
import com.kh.lahol.cafe.user.model.dao.CafeDao;
import com.kh.lahol.cafe.user.model.vo.CafeRes;

@Service
public class CafeBizServiceImpl implements CafeBizService{
	@Autowired
	private CafeBizDao caBizDao;

	@Override
	public int insertCafeInfo(Cafe c) {
		return caBizDao.insertCafeInfo(c);
	}

	@Override
	public List<Cafe> selectCafeList(String Id) {
		return caBizDao.selectCafeList(Id);
	}

	@Override
	public int updateCafeInfo(Cafe c) {
		return caBizDao.updateCafeInfo(c);
	}

	@Override
	public int deleteCafeInfo(String caCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Cafe selectCafeInfo(String caCode) {
		
		return caBizDao.selectCafeInfo(caCode);
	}

	@Override
	public List<Coffee> selectCoffeeList(PageInfo pi) {
		return caBizDao.selectCoffeeList(pi);
	}

	@Override
	public Cafe caWriteSelect(String Id) {
		return caBizDao.caWriteSelect(Id);
	}

	@Override
	public int insertCoffee(Coffee co) {
		return caBizDao.insertCoffee(co);
	}

	@Override
	public Coffee selectCoffeeInfo(String cfNo) {
		return caBizDao.selectCoffeeInfo(cfNo);
	}

	@Override
	public int updateCoffeeInfo(Coffee co) {
		return caBizDao.updateCoffeInfo(co);
	}

	@Override
	public int coffeeDelete(String cfNo) {
		return caBizDao.coffeeDelete(cfNo);
	}

	@Override
	public int cafeDelete(String caCode) {
		return caBizDao.cafeDelete(caCode);
	}

	@Override
	public int selectCoffeeCount(String caCode) {
		return caBizDao.selectCoffeeCount(caCode);
	}

	@Override
	public List<CafeRes> selectCafeResList(String id) {
		return caBizDao.selectCafeResList(id);
	}



	
	
	

}
