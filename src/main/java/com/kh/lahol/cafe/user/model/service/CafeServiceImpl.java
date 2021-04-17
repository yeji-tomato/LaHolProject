package com.kh.lahol.cafe.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.user.model.dao.CafeDao;
import com.kh.lahol.cafe.user.model.vo.CafeRes;

@Service
public class CafeServiceImpl implements CafeService{
	@Autowired
	private CafeDao caDao;
	
	@Override
	public int hereInsertRes(CafeRes r) {
		return caDao.hereInsertRes(r);
	}

	@Override
	public int togoInsertRes(CafeRes r) {
		return caDao.togoInsertRes(r);
	}

	@Override
	public List<Cafe> cafeMainList() {
		return caDao.cafeMainList();
	}

	@Override
	public Cafe searchDetail(String caCode) {
		return caDao.searchDetail(caCode);
	}
	

}
