package com.kh.lahol.cafe.bus.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(BMainController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/cafe/home", method = RequestMethod.GET)
	public String Home(Locale locale, Model model) {
		
		
		return "cafe/bus/home";
	}
	
	@RequestMapping(value = "/cafe/order", method = RequestMethod.GET)
	public String Order(Locale locale, Model model) {
		
		
		return "cafe/bus/order";
	}
	
	@RequestMapping(value = "/cafe/res", method = RequestMethod.GET)
	public String Res(Locale locale, Model model) {
		
		
		return "cafe/bus/res";
	}
	
	
	@RequestMapping(value = "/cafe/write", method = RequestMethod.GET)
	public String Write(Locale locale, Model model) {
		
		
		return "cafe/bus/write";
	}
	
	
	@RequestMapping(value = "/cafe/confirm", method = RequestMethod.GET)
	public String confirm(Locale locale, Model model) {
		
		
		return "cafe/bus/confirm";
	}
	
	
	

}
