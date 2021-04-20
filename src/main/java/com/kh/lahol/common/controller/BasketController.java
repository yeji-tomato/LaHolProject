package com.kh.lahol.common.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BasketController {
	
private static final Logger logger = LoggerFactory.getLogger(BusMainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/basket/cart", method = RequestMethod.GET)
	public String Basket(Locale locale, Model model) {
		
		
		return "basket/basket";
	}
	
	@RequestMapping(value = "/basket/coupon", method = RequestMethod.GET)
	public String Coupon(Locale locale, Model model) {
		
		
		return "basket/coupon";
	}
}
