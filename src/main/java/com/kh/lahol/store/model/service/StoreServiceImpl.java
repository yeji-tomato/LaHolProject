package com.kh.lahol.store.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.store.model.dao.StoreDao;
import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Search; 
import com.kh.lahol.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao sDao;
	
	//게시글수 카운트 
	@Override
	public int selectListCount() { 
		return sDao.selectListCount();
	}

	@Override
	public List<Store> selectList(PageInfo pi) {
		 
		return sDao.selectList(pi);
	}
	
	@Override
	public List<Store> selectList2(PageInfo pi2) {
		return sDao.selectList2(pi2);
	}

 

	@Override
	public int selectSearchCount(Search search) {
		return sDao.selectSearchCount(search);
	}

	@Override
	public List<Store> searchList(Search search, PageInfo pi) {
		return sDao.searchList(search , pi);
	}

 
	@Override
	public Store selectStore(int PR_CODE, boolean falg) {
		
		 if(falg) sDao.updateReadCount(PR_CODE);
		 return sDao.selectStore(PR_CODE);
	}
	
	//스토어 관리 
	@Override
	public List<Store> myselectList(PageInfo pi, String id) {
		return sDao.myselectList(pi,id);
		 
	}
	//스토어 내가쓴 글 카운트 
	@Override
	public int mySearchCount(String id) { 
		return sDao.mySearchCount(id);
	}

 


}
