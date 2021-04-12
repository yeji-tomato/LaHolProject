package com.kh.lahol.admin.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.lahol.admin.model.service.AdminService;
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
}
