package com.kh.lahol.cafe.user.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.user.model.exception.CafeException;
import com.kh.lahol.cafe.user.model.service.CafeService;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.member.model.vo.Member;

@Controller
@RequestMapping("/cafe")
@SessionAttributes({"loginUser"})
public class CafeUserController {
	
	@Autowired private CafeService caService;
	 
	
	private static final Logger logger = LoggerFactory.getLogger(CafeUserController.class);
	
	// 검색 페이지로 이동
	@GetMapping("/user")
	public ModelAndView cafeMain(ModelAndView mv) {
		
		List<Cafe> CafeMainList = caService.cafeMainList();
		
		if(CafeMainList != null) {
			mv.addObject("CafeMainList", CafeMainList);
			mv.setViewName("cafe/user/cafeMain");
		}else {
			mv.addObject("msg", "해당하는 카페 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		
		
		return mv;
	}
	
	// 검색 세부 페이지로 이동
	@GetMapping("/detail")
	public String searchDetail(@RequestParam String caCode, Model model) {
		
		Cafe cafeInfo = caService.searchDetail(caCode);
		
		if(cafeInfo != null) {
			model.addAttribute("cafeInfo", cafeInfo);
			return "/cafe/user/detail";
		}else {
			model.addAttribute("msg", "등록된 카페 보기에 실패하였습니다.");
			return "common/error";
		}
	}
	
	// 매장 페이지 이동
	@GetMapping("/here")
	public String Here() {
		return "/cafe/user/here";
	}
	
	// 매장 insert
	@PostMapping("/here/insert")
	//DD MONTH, YYYY
	public String hereInsert(Date caDate,@ModelAttribute CafeRes r) throws CafeException{
		
		
		System.out.println("caResDate: "+ caDate);
		r.setCaResDate(caDate);
		System.out.println(r);
		
		int result = caService.hereInsertRes(r);
		System.out.println("result : "+ result);
		
		if(result > 0) {
			return "/cafe/user/beverage";
		}else {
			throw new CafeException("카페 예약에 실패하였습니다.");
		}
		
	}

	// 포장 페이지 이동
	@GetMapping("/togo")
	public String Beverage() {
		return "/cafe/user/togo";
	}
	

	// 포장 insert
	@PostMapping("/togo/insert")
	//DD MONTH, YYYY
	public String togoInsert(Date caDate, String caResTime,@ModelAttribute CafeRes r) throws CafeException{
		r.setCaResDate(caDate);
		r.setCaResGoTime(caResTime);
		System.out.println("caResGoTime: "+ caDate);
		System.out.println("caResTime: "+ caResTime);
		System.out.println(r);
		
		int result = caService.togoInsertRes(r);
		System.out.println("result : "+ result);
		
		if(result > 0) {
			return "/cafe/user/beverage";
		}else {
			throw new CafeException("카페 예약에 실패하였습니다.");
		}	
	}
	
	// 음료 선택 페이지 이동
	@GetMapping("/beverage")
	public String togo() {
		return "/cafe/user/beverage";
	}
	
	

}
