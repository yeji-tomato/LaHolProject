package com.kh.lahol.store.model.dao;

import java.util.List;

import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Store;

public interface StoreDao {

	public int selectListCount();
	
	public List<Store> selectList(PageInfo pi);
	
	public List<Store> selectList2(PageInfo pi2);
	
	public int insertStore(Store s);
	
	public int updateReadCount(int PR_CODE);
	
	public int selectStore(int PR_CODE);
	
	public int updateStore(Store s);
	
	public int deleteStore(int PR_CODE);
	
}
