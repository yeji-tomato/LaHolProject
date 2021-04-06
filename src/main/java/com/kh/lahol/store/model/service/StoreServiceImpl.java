package com.kh.lahol.store.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.store.model.dao.StoreDao;
import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao sDao;
	
	@Override
	public int selectListCount() { 
		return sDao.selectListCount();
	}

	@Override
	public List<Store> selectList(PageInfo pi) {
		 
		return sDao.selectList(pi);
	}

	@Override
	public int insertStore(Store s) { 
		return 0;
	}

	@Override
	public Store selectStore(int PR_CODE, boolean falg) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateStore(Store s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStore(int PR_CODE) {
		// TODO Auto-generated method stub
		return 0;
	}

}
