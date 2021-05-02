package com.kh.lahol.playground.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.lahol.admin.model.service.AdminService;
import com.kh.lahol.admin.model.vo.Game;

@Controller
public class playController {
	
	@Autowired
	private AdminService adminService;
	
	// 플레이그라운드 인트로
	@RequestMapping("/playground/intro")
	public String playIntro(Locale locale, HttpServletRequest request, RedirectAttributes rd) {
		
		if(request.getSession().getAttribute("loginUser") == null) {
//			rd.addFlashAttribute("msg", "로그인이 필요한 서비스입니다"); 
			return "redirect:/member/loginView";			
		} else {
			return "playground/intro";
		}
	}

	// 플레이그라운드 원두테스트
	@RequestMapping("/playground/test")
	public String beanTest(Locale locale, Model model) {
		return "playground/test";
	}
	
	// 플레이그라운드 원두테스트 결과
	@RequestMapping("/playground/")
	public String beanTestResult(Locale locale, Model model) {
		return "playground/testResult";
	}
	
	// 플레이그라운드 게임
	@RequestMapping("/playground/game")
	public String game(Locale locale, Model model) {
		return "playground/game";
	}
	
	
	// 쿠폰 발급 인서트
	@RequestMapping(value="/game/insertCoupon", method=RequestMethod.GET)
	   public void insertCouponToUser(String id, String couponName, String couponLimit, String issuedBy,
	                           @ModelAttribute Game gm, HttpServletResponse response) {
	      gm.setId(id);
	      gm.setCouponName(couponName);
	      gm.setCouponLimit(couponLimit);
	      gm.setCouponName(couponName);
	      
	      System.out.println(gm);
	      
	      adminService.insertCouponToUser(gm);
	      
	      try {
	         PrintWriter out = response.getWriter();
	         out.print("success");
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }
	
	
}
