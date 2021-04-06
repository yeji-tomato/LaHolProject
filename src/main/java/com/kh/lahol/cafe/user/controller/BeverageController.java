package com.kh.lahol.cafe.user.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BeverageController {
	
	private static final Logger logger = LoggerFactory.getLogger(BeverageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/cafe/beverage", method = RequestMethod.GET)
	public String Beverage(Locale locale, Model model) {
		
		
		return "cafe/user/beverage";
	}

}
