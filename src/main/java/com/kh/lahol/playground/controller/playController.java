package com.kh.lahol.playground.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class playController {
	
	// 플레이그라운드 인트로
	@RequestMapping("/playground/intro")
	public String playIntro(Locale locale, Model model) {
		return "playground/intro";
	}

	// 플레이그라운드 원두테스트
	@RequestMapping("/playground/test")
	public String beanTest(Locale locale, Model model) {
		return "playground/test";
	}
	
	// 플레이그라운드 원두테스트 결과
	@RequestMapping("/playground/testResult")
	public String beanTestResult(Locale locale, Model model) {
		return "playground/testResult";
	}
	
	// 플레이그라운드 게임
	@RequestMapping("/playground/game")
	public String game(Locale locale, Model model) {
		return "playground/game";
	}
	
	
}
