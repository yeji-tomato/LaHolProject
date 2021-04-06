package com.kh.lahol.cafe.user.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class TogoController {
	
private static final Logger logger = LoggerFactory.getLogger(TogoController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/cafe/togo", method = RequestMethod.GET)
	public String search(Locale locale, Model model) {
		
		
		return "cafe/user/togo";
	}
	
	

}
