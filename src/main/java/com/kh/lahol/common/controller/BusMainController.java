package com.kh.lahol.common.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BusMainController {
	
private static final Logger logger = LoggerFactory.getLogger(BusMainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/bus/main", method = RequestMethod.GET)
	public String Beverage(Locale locale, Model model) {
		
		
		return "main/busMain";
	}
	
	// 에러페이지 
	@RequestMapping("/common/error")
	public String error(Locale locale, Model model) {
		return "common/error";
	}

}
