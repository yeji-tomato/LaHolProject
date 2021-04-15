package com.kh.lahol.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.lahol.cafe.bus.model.service.CafeBizService;
import com.kh.lahol.coffeeclass.model.service.CoffeeClassSerivce;
import com.kh.lahol.store.model.service.StoreService;

@Controller
public class ReportController {
	
	@Autowired
	private CoffeeClassSerivce clService;
	@Autowired
	private CafeBizService cafeService;
	@Autowired
	private StoreService sService;
	
	@PostMapping("/coffeeclass/classreport")
	public String classReport() {
		return "";
	}
	
	@PostMapping("/coffeeclass/cafereport")
	public String cafeReport() {
		return "";
	}
	
	@PostMapping("/coffeeclass/storereport")
	public String storeReport() {
		return "";
	}
}
