package com.kh.lahol.cafe.user.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.lahol.cafe.user.model.exception.CafeException;
import com.kh.lahol.cafe.user.model.service.CafeService;
import com.kh.lahol.cafe.user.model.vo.Res;

@Controller
@RequestMapping("/cafe")
public class CafeUserController {
	/*
	 * @Autowired private CafeService caService;
	 */
	
	private static final Logger logger = LoggerFactory.getLogger(CafeUserController.class);
	
	// 검색 페이지로 이동
	@GetMapping("/user")
	public String search() {
		return "/user/search";
	}
	
	// 검색 세부 페이지로 이동
	@GetMapping("/detail")
	public String searchDetail() {
		return "/user/detail";
	}
	
	// 매장 페이지 이동
	@GetMapping("/here")
	public String Here() {
		return "/user/here";
	}
	
	// 매장 insert
	@PostMapping("/here/insert")
	public String hereInsert(Res r, HttpServletRequest request){
		System.out.println("넘어오는 값 : " + r);
		
		return null;
		
		//int result = caService.hereInsertRes(r);
		
		/*
		 * if(result > 0) { return "/user/beverage"; }else { throw new
		 * CafeException("카페 예약에 실패하였습니다."); }
		 */
		
	}
	
	
	// 포장 페이지 이동
	@GetMapping("/beverage")
	public String Beverage() {
		return "/user/togo";
	}
	
	// 음료 선택 페이지 이동
	@GetMapping("/togo")
	public String togo() {
		return "/user/beverage";
	}
	
	

}
