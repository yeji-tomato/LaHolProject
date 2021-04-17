package com.kh.lahol.store.page;

import com.kh.lahol.store.model.vo.PageInfo;

public class Pagination3 { 
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi2 = null; 
		
		int pageLimit = 10;	  
		int StoreLimit = 30; // Q&A 페이징 처리 못해서 임시로 만듬 
		
		int maxPage = (int)Math.ceil((double)listCount / StoreLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		 
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi2 = new PageInfo(currentPage,  listCount, pageLimit, maxPage, startPage, endPage, StoreLimit);
		
		return pi2;
	}
}
