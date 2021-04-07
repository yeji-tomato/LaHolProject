package com.kh.lahol.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.store.model.service.StoreService;
import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Store;
import com.kh.lahol.store.page.Pagination;
import com.kh.lahol.store.page.Pagination2;

@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreService sService;
	// 상품 리스트 페이지
	@GetMapping("/list")
	public ModelAndView storeList(ModelAndView mv,
    @RequestParam(value="page" , required=false, defaultValue="1")int currentPage) {
		
		int listCount = sService.selectListCount();
		 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo pi2 = Pagination2.getPageInfo(currentPage, listCount);
		List<Store> list = sService.selectList(pi);
		
		List<Store> list2 = sService.selectList(pi2);
		 
		if(list !=null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("store/storemain");
		} else {
		
		}
		
		if(list2 !=null) {
			mv.addObject("list2", list2);
			mv.addObject("pi2", pi2);
			mv.setViewName("store/storemain");
		} else {
		
		}
		
		 
		
		return mv;
	}
	// 관리자 페이지
	@GetMapping("/list2")
	public ModelAndView storeList2(ModelAndView mv,
    @RequestParam(value="page" , required=false, defaultValue="1")int currentPage) {
		
		int listCount = sService.selectListCount();
		 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo pi2 = Pagination2.getPageInfo(currentPage, listCount);
		List<Store> list = sService.selectList(pi);
		
		 
		 
		if(list !=null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("store/B/storemanager");
		} else {
		
		}
		
		 
		
		 
		
		return mv;
	}
	
	@GetMapping("/write")
	public String writepageView() {
		return "store/prcreate";
	}
	
	
	
}
