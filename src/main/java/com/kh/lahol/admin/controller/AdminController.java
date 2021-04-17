package com.kh.lahol.admin.controller;

import java.sql.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.admin.model.service.AdminService;
import com.kh.lahol.admin.model.service.AdminServiceImpl;
import com.kh.lahol.member.model.vo.Coupon;


@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginUser"})
public class AdminController {

	@Autowired
	private AdminService adminService;
		
	// 회원리스트 (일반)
	@RequestMapping("/user/normalList")
	public String normalList(Locale locale, Model model) {
		return "admin/user/normalList";
	}
	
	// 회원리스트 (사업자)
	@RequestMapping("/user/partnerList")
	public String partnerList(Locale locale, Model model) {
		return "admin/user/partnerList";
	}
	
	// 카페 입점현황
	@RequestMapping("/cafe/cafeList")
	public String cafeList(Locale locale, Model model) {
		return "admin/cafe/cafeList";
	}
	
	// 카페 프로모션
	@RequestMapping("/cafe/promotion")
	public String promotion(Locale locale, Model model) {
		return "admin/cafe/promotion";
	}
	
	// 수익 
	@RequestMapping("/profit")
	public String profit(Locale locale, Model model) {
		return "admin/profit";
	}
	
	// 쿠폰
	@RequestMapping("/coupon")
	public String coupon(Locale locale, Model model) {
		return "admin/coupon";
	}
	
	// 신고 (일반)
	@RequestMapping("/report/normal")
	public String reportNormal(Locale locale, Model model) {
		return "admin/report/normal";
	}
	
	// 신고 (사업자)
	@RequestMapping("/report/partner")
	public String reportPartner(Locale locale, Model model) {
		return "admin/report/partner";
	}
	
	@RequestMapping(value="/selectCouponByTerm", method=RequestMethod.POST)
	@ResponseBody
	public List<Coupon> selectCouponByTerm(@RequestBody Map<String, Object> dates) {
		return adminService.selectCouponByTerm(dates);
	}
	
	
}
