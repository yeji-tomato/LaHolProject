package com.kh.lahol.store.model.service;

import java.util.List;

import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Search;
import com.kh.lahol.store.model.vo.Store;

public interface StoreService {
	//.1 게시글 수 카운트
	public int selectListCount();
	
	//2. 페이징 처리 된 게시글 목록 조회
	public List<Store> selectList(PageInfo pi);
	
	public List<Store> selectList2(PageInfo pi2);
	
	

	//7. 게시글 검색
	public List<Store> searchList(  Search search, PageInfo pi);
	// 검색된 게시글 카운트
	public int selectSearchCount(Search search);
	//4. 디테일 뷰
	public Store selectStore(int pR_CODE, boolean falg);
	


	
	
	
}
