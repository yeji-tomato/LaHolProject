package com.kh.lahol.cafe.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.user.model.exception.CafeException;
import com.kh.lahol.cafe.user.model.service.CafeService;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.cafe.user.model.vo.CoffeeCart;
import com.kh.lahol.cafe.user.model.vo.CoffeeRes;
import com.kh.lahol.member.model.vo.Member;

@Controller
@RequestMapping("/cafe")
@SessionAttributes({"loginUser"})
public class CafeUserController {
	
	@Autowired private CafeService caService;
	 
	
	private static final Logger logger = LoggerFactory.getLogger(CafeUserController.class);
	
	// 검색 페이지로 이동
	@GetMapping("/user")
	public ModelAndView cafeMain(ModelAndView mv) {
		
		List<Cafe> CafeMainList = caService.cafeMainList();
		
		if(CafeMainList != null) {
			mv.addObject("CafeMainList", CafeMainList);
			mv.setViewName("cafe/user/cafeMain");
		}else {
			mv.addObject("msg", "해당하는 카페 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		
		
		return mv;
	}
	
	// 검색 세부 페이지로 이동
	@GetMapping("/detail")
	public String searchDetail(@RequestParam String caCode, Model model) {
		
		Cafe cafeInfo = caService.searchDetail(caCode);
		
		if(cafeInfo != null) {
			model.addAttribute("cafeInfo", cafeInfo);
			return "/cafe/user/detail";
		}else {
			model.addAttribute("msg", "등록된 카페 보기에 실패하였습니다.");
			return "common/error";
		}
	}
	
	// 매장 페이지 이동
	@GetMapping("/here")
	public String Here(@RequestParam String caCode, Model model) {
		
		Cafe cafeInfo = caService.searchDetail(caCode);
		
		if(cafeInfo != null) {
			model.addAttribute("cafeInfo", cafeInfo);
			return "/cafe/user/here";
		}else {
			model.addAttribute("msg", "등록된 카페 보기에 실패하였습니다.");
			return "common/error";
		}	
		
	}
	
	// 매장 insert
	@PostMapping("/here/insert")
	//DD MONTH, YYYY
	public String hereInsert(Date caDate,@ModelAttribute CafeRes r) throws CafeException{
		
		//System.out.println("caResDate: "+ caDate);
		r.setCaResDate(caDate);
		//System.out.println(r);
		
		int result = caService.hereInsertRes(r);
		// System.out.println("result : "+ result);
		
		if(result > 0) {
			return "/cafe/user/beverage";
		}else {
			throw new CafeException("카페 예약에 실패하였습니다.");
		}
		
	}

	// 포장 페이지 이동
	@GetMapping("/togo")
	public String Beverage() {
		return "/cafe/user/togo";
	}
	

	// 포장 insert
	@PostMapping("/togo/insert")
	//DD MONTH, YYYY
	public String togoInsert(Date caDate, String caResTime,@ModelAttribute CafeRes r) throws CafeException{
		r.setCaResDate(caDate);
		r.setCaResGoTime(caResTime);
		//System.out.println("caResGoTime: "+ caDate);
		//System.out.println("caResTime: "+ caResTime);
		//System.out.println(r);
		
		int result = caService.togoInsertRes(r);
		//System.out.println("result : "+ result);
		
		if(result > 0) {
			return "/cafe/user/beverage";
		}else {
			throw new CafeException("카페 예약에 실패하였습니다.");
		}	
	}
	
	// 음료 선택 페이지 이동
	@GetMapping("/beverage")
	public ModelAndView coffeeBeverage(@SessionAttribute("loginUser") Member m,
										ModelAndView mv, @RequestParam String caCode) {
		
		// System.out.println(caCode + "caCode");
		
		List<Coffee> Coffeelist = caService.coffeeBeverage(caCode);
		String Id = m.getId();
		// System.out.println("아이디 : "+ Id);
		CafeRes cafeRes = caService.hereTogoInfo(Id);
		//System.out.println("selectRes : "+ cafeRes);
		
		
		mv.addObject("Coffeelist", Coffeelist);
		mv.addObject("cafeRes", cafeRes);
		mv.setViewName("cafe/user/beverage");

		return mv;
		
	}
	
	@PostMapping("/coRes/insert")
	public String coResInsert(@ModelAttribute CoffeeRes coRes) throws CafeException{
		//System.out.println(coRes);
		int result = caService.coResInsert(coRes);
		//System.out.println(coRes.getCfNo());
		
		if(result > 0) {
			return "/cafe/user/beverageModal";
		}else {
			throw new CafeException("카페 예약에 실패하였습니다.");
		}
	}
	
	private List<CoffeeCart> CoffeeCart;
	
	  @GetMapping("/coRes/basket") 
	  public void coResBasket(@SessionAttribute("loginUser") Member m, ModelAndView mv, HttpServletResponse response,
			  				String cfNo, String caResNo, @ModelAttribute CoffeeCart coCart) {
		  response.setContentType("application/json; charset=utf-8");
		  
	  String id = m.getId();
	  coCart.setCfNo(cfNo);
	  coCart.setCaResNo(caResNo);
	  coCart.setId(id);
	  //System.out.println(coCart);
	  
		try {
			CoffeeCart = caService.coResBasket(coCart);
			PrintWriter out = response.getWriter();
			out.print(new Gson().toJson(CoffeeCart));
		} catch (IOException e) {
			e.printStackTrace();
		}
	   
		//System.out.println(CoffeeCart);
	 
	 }

	  @GetMapping("/coffee/order")
	public String coffeeOrder() {
		  
		return "/cafe/user/coffeeOrder";
	}
	
	
	

}
