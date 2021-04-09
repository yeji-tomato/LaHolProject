package com.kh.lahol.cafe.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	

}
