package com.kh.lahol.store.page;

import com.kh.lahol.store.model.vo.PageInfo;

public class Pagination { 
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null; 
		
		int pageLimit = 10;	  
		int StoreLimit = 9; // 3개 인기 상품 9개 일반 상품
		
		int maxPage = (int)Math.ceil((double)listCount / StoreLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		 
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage,  listCount, pageLimit, maxPage, startPage, endPage, StoreLimit);
		
		return pi;
	}
}
