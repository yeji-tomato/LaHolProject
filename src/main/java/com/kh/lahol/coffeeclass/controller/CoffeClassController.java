package com.kh.lahol.coffeeclass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.coffeeclass.model.service.CoffeeClassSerivce;

@Controller
@RequestMapping("/coffeeclass")
public class CoffeClassController {
	@Autowired
	private CoffeeClassSerivce clService;
	
	//사용자 메인페이지
	@GetMapping("/coffeeclass")
	public ModelAndView CoffeeClassList(ModelAndView mv, // 메뉴바 클릭시 파라미터가 따로 없으므로 1로 설정(1페이지)
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		// 클래스 개수 구하기
		int listCount = clService.selectListCount();
		System.out.println(listCount);
		
		
		return mv;
		
	}
	
	/*
	 * // 사용자 메인페이지
	 * 
	 * @GetMapping("/coffeeclass") public String main() { return
	 * "coffeeclass/class_main"; }
	 * 
	 * 
	 * 
	 * // 사업자 커피클래스 메인 페이지
	 * 
	 * @GetMapping("/coffeeclass/busmain") public String busmain() { return
	 * "coffeeclass/bus_classmain"; }
	 */
}
