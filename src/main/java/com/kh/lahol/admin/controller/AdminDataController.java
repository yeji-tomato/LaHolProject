package com.kh.lahol.admin.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.lahol.admin.model.service.AdminService;
import com.kh.lahol.admin.model.vo.Promotion;
import com.kh.lahol.member.model.vo.Coupon;
import com.kh.lahol.member.model.vo.Member;

@RestController
public class AdminDataController {
	@Autowired
	private AdminService adminService;
	
	// 일반회원 리스트 조회
	@GetMapping("/admin/user/test") 
	public List<Member> selectNormalList(){
		return adminService.selectNormalList();
	}
	
	// 사업자회원 리스트 조회
	@GetMapping("/admin/partner/test")
	public List<Member> selectPartnerList(){
		return adminService.selectPartnerList(); 
	}
	
	// 쿠폰 날짜 별 조회
	@GetMapping("/admin/coupon/{date}")
	public List<Coupon> selectCouponByDate(@PathVariable String date) {
		return adminService.selectCouponByDate(date);
	}
	
	// 광고 승인대기 리스트 조회
	@GetMapping("/admin/promo/waiting")
	public List<Promotion> selectAdWaitingList(){
		return adminService.selectAdWaitingList();
	}
	
	// 광고 승인완료 리스트 조회
	@GetMapping("/admin/promo/confirmed")
	public List<Promotion> selectAdConfirmedList(){
		return adminService.selectAdConfirmedList();
	}
}
