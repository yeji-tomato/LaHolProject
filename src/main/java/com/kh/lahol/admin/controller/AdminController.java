package com.kh.lahol.admin.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.admin.model.dao.service.AdminService;


@Controller
public class AdminController {

//	@Autowired
//	private AdminService aService;
	
	// 회원리스트 (일반)
	@RequestMapping("/admin/user/normalList")
	public String normalList(Locale locale, Model model) {
		return "admin/user/normalList";
	}
	
	// 회원리스트 (사업자)
	@RequestMapping("/admin/user/partnerList")
	public String partnerList(Locale locale, Model model) {
		return "admin/user/partnerList";
	}
	
	// 카페 입점현황
	@RequestMapping("/admin/cafe/cafeList")
	public String cafeList(Locale locale, Model model) {
		return "admin/cafe/cafeList";
	}
	
	// 카페 프로모션
	@RequestMapping("/admin/cafe/promotion")
	public String promotion(Locale locale, Model model) {
		return "admin/cafe/promotion";
	}
	
	// 수익 
	@RequestMapping("/admin/profit")
	public String profit(Locale locale, Model model) {
		return "admin/profit";
	}
	
	// 쿠폰
	@RequestMapping("/admin/coupon")
	public String coupon(Locale locale, Model model) {
		return "admin/coupon";
	}
	
	// 신고 (일반)
	@RequestMapping("/admin/report/normal")
	public String reportNormal(Locale locale, Model model) {
		return "admin/report/normal";
	}
	
	// 신고 (사업자)
	@RequestMapping("/admin/report/partner")
	public String reportPartner(Locale locale, Model model) {
		return "admin/report/partner";
	}
	
}
