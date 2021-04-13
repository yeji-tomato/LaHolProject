package com.kh.lahol.cafe.bus.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.cafe.bus.model.dao.CafeBizDao;
import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.user.model.dao.CafeDao;

@Service
public class CafeBizServiceImpl implements CafeBizService{
	@Autowired
	private CafeBizDao caBizDao;

	@Override
	public int insertCafeInfo(Cafe c) {
		return caBizDao.insertCafeInfo(c);
	}

	@Override
	public List<Cafe> selectCafeList() {
		return caBizDao.selectCafeList();
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
	public List<Coffee> selectCoffeeList(String caCode) {
		return caBizDao.selectCoffeeList(caCode);
	}

	@Override
	public Cafe caWriteSelect(String caId) {
		return caBizDao.caWriteSelect(caId);
	}


	
	
	

}
