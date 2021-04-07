package com.kh.lahol.coffeeclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassDetailController {
	
	@GetMapping("/coffeeclass/classdetail")
	public String classdetail() {
		return "coffeeclass/class_detail";
	}

}
