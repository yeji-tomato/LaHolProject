package com.kh.lahol.coffeeclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CoffeClassController {
	
	@GetMapping("/coffeeclass")
	public String main() {
		return "coffeeclass/class_main";
	}
	
	@GetMapping("/coffeeclass/busmain")
	public String busmain() {
		return "coffeeclass/bus_classmain";
	}
	
	@GetMapping("/coffeeclass/busdetail")
	public String busdetail() {
		return "coffeeclass/bus_classdetail";
	}

	

}
