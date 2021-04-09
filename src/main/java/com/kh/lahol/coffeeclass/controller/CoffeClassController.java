package com.kh.lahol.coffeeclass.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.coffeeclass.model.service.CoffeeClassSerivce;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;
import com.kh.lahol.coffeeclass.page.Pagination;

@Controller
public class CoffeClassController {

	@Autowired
	private CoffeeClassSerivce clService;

	// 사용자 메인페이지

	@GetMapping("/coffeeclass")
	public ModelAndView coffeeClassList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) { // 메뉴바 클릭시 파라미터가 따로
																									// 없으므로 1로 설정(1페이지)

		int listCount = clService.selectListCount(); // 게시글 갯수

		// 요청 페이지에 맞는 클래스 리스트 조회
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<CoffeeClass> list = clService.selectList(pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("coffeeclass/class_main");
		} else {
			mv.addObject("msg", "클래스 페이지에 접근할 수 없습니다.");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	// 사용자 메인페이지
//	@GetMapping("/")
//	public String main() {
//		return "coffeeclass/class_main";
//	}

	// 사용자 메인페이지
	/*
	 * @GetMapping("/") public String main() { return "coffeeclass/class_main"; }
	 */

	/*
	 * 
	 * 
	 * // 사업자 커피클래스 메인 페이지
	 * 
	 * @GetMapping("/coffeeclass/busmain") public String busmain() { return
	 * "coffeeclass/bus_classmain"; }
	 */
}
