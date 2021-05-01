package com.kh.lahol.coffeeclass.page;

import com.kh.lahol.coffeeclass.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null; 
		
		int pageLimit = 10;	  
		int classLimit = 5; 
		
		int maxPage = (int)Math.ceil((double)listCount / classLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		 
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage,  listCount, pageLimit, maxPage, startPage, endPage, classLimit);
		
		return pi;
	}
}
