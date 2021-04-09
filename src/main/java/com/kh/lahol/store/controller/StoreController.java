package com.kh.lahol.store.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.store.model.service.StoreService;
import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Search; 
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
	public ModelAndView storeList(ModelAndView mv,HttpServletRequest request,
    @RequestParam(value="page" , required=false, defaultValue="1")int currentPage) {
		
		//일반 게시글 카운트 
		int listCount = sService.selectListCount();
		 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		//추천게시글은 3개만 출력
		PageInfo pi2 = Pagination2.getPageInfo(currentPage, listCount);
		List<Store> list = sService.selectList(pi);
		//추천 게시글 용
		List<Store> list2 = sService.selectList2(pi2);
		 
		if(list !=null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("store/storemain");
		} else {
		
		}
		
		if(list2 !=null) {
			mv.addObject("list2", list2); 
			mv.setViewName("store/storemain");
		} else {
		
		}
		
		 
		
		return mv;
	}
	// 관리자 페이지
	@GetMapping("/list2")
	public ModelAndView storeList2( ModelAndView mv,HttpServletRequest request, HttpSession session,
    @RequestParam(value="page" , required=false, defaultValue="1")int currentPage) {
		
	 
		Member loginUser = (Member)session.getAttribute("loginUser");
		String Id = loginUser.getId();
		System.out.println(Id);		
		
		//내가 작성한 게시글 수만 카운트
		int listCount = sService.mySearchCount(Id);
		 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		List<Store> list = sService.myselectList(pi,Id);
		
		 
		 
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
	
	
				 
	@GetMapping("/search")
	public ModelAndView storeSearch(ModelAndView mv, @ModelAttribute Search search,HttpServletRequest request,
							   Model model , @RequestParam(value="page" , required=false, defaultValue="1")int currentPage)  {
		
		 
		String condition = request.getParameter("searchCondition");
		String value = request.getParameter("searchValue");
		
		
		 Search sc = new Search();
		
		 sc.setSearchCondition(condition);
		 sc.setSearchValue(value);
	 
		 
	 
		
		 int listCount = sService.selectSearchCount(sc); 
		//int listCount = sService.selectListCount();
		 PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		 PageInfo pi2 = Pagination2.getPageInfo(currentPage, listCount);
		 
		 
		 
		List<Store> searchList = sService.searchList(sc,pi); 
		List<Store> list2 = sService.selectList2(pi2);
	
		if(searchList !=null) {
			mv.addObject("list", searchList);
			mv.addObject("pi", pi);
			mv.setViewName("store/storemain");
		} else {
		
		}
		if(searchList !=null) {
			mv.addObject("list2", list2); 
			mv.setViewName("store/storemain");
		} else {
		
		}
		  
		return mv;
	}
	
	@GetMapping("/storedetail")
	public String storeDetail(int PR_CODE,  HttpServletRequest request,
			  HttpServletResponse response,
			  Model model) {
		boolean flagslist = false; 
		boolean flagPR = false; 
		
		Cookie[] cookies = request.getCookies();
		try {
			if (cookies != null) {
				for (Cookie c : cookies) {
				 
					if (c.getName().equals("slist")) {
						flagslist = true;
						 
						String slist = URLDecoder.decode(c.getValue(), "UTF-8");
						 
						String[] list = slist.split(",");
						for(String st : list) {
						 
							if(st.equals(String.valueOf(PR_CODE))) flagPR = true;
						}
						if(!flagPR) {	// 게시글을 읽지 않았다면
							c.setValue(URLEncoder.encode(slist + "," + PR_CODE, "UTF-8"));
							response.addCookie(c); // 응답에 담아 보냄
						}
					}
				}
				if(!flagslist) {
					 
					Cookie c1 = new Cookie("slist", URLEncoder.encode(String.valueOf(PR_CODE), "UTF-8"));
					response.addCookie(c1);
							}
						}
			
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					
					
		
		 
		
			Store s = sService.selectStore(PR_CODE, !flagPR);
		
		 
			 
			if(s != null) {
				model.addAttribute("s", s); 
				return "store/storedetail";
			} else {
				return "store/storedetail";
			}
		
		
		 
		
		
	}
	
	
}
