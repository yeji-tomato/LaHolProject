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

@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreService sService;
	
	@GetMapping("/list")
	public ModelAndView storeList(ModelAndView mv,
    @RequestParam(value="page" , required=false, defaultValue="1")int currentPage) {
		
		int listCount = sService.selectListCount();
		 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Store> list = sService.selectList(pi);
		 
		if(list !=null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("store/storemain");
		} else {
		
		}
		
		return mv;
	}
	
	
	
}
