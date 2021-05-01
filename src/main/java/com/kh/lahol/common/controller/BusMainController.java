package com.kh.lahol.common.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.cafe.bus.model.service.CafeBizService;
import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.member.model.vo.Member;

@Controller
public class BusMainController {
	
	@Autowired private CafeBizService caBizService;
	
private static final Logger logger = LoggerFactory.getLogger(BusMainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/bus/main", method = RequestMethod.GET)
	public ModelAndView Beverage(Locale locale, Model model, ModelAndView mv, @SessionAttribute("loginUser") Member m) {
		String id = m.getId();
		
		Cafe ca = caBizService.cafeHome(id);
		System.out.println(ca);
		if(ca != null) {
			mv.addObject("ca", ca);
			mv.setViewName("main/busMain");
		}else {
			mv.addObject("msg", "해당하는 카페 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
		
	}
	
	// 에러페이지 
	@RequestMapping("/common/error")
	public String error(Locale locale, Model model) {
		return "common/error";
	}

}
