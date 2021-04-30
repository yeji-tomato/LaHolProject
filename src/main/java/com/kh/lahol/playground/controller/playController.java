package com.kh.lahol.playground.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class playController {
	
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
		
		// 아이디, 발급경로, 발급일 체크
		
		// null이 아니면 메인으로
		// null이면 게임으로
		
		
		return "playground/game";
	}
	
	
}
