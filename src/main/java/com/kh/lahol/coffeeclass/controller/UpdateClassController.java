package com.kh.lahol.coffeeclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UpdateClassController {
	
	@GetMapping("/coffeeclass/updateclass")
	public String updateclass() {
		return "coffeeclass/bus_classupdate";
	}


}
