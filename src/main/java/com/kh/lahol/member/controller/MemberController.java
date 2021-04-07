package com.kh.lahol.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.lahol.member.model.service.MemberService;
import com.kh.lahol.member.model.vo.M_Normal;
import com.kh.lahol.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginUser"})
public class MemberController {
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	@GetMapping("/signUpView")
	public String signUpView() {
		return "member/signUp_main";
	}
	
	@GetMapping("/nsignUpView")
	public String nsignUpView() {
		return "member/signUp_N";
	}
	
	@GetMapping("/psignUpView")
	public String psignUpView() {
		return "member/signUp_P";
	}
	
	// 아이디 중복확인
	@PostMapping("/idCheck")
	public void idCheck(String userId, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			
			Member m = mService.selectMember(userId);
			
			System.out.println(m);
			
			if(m != null) {
				out.write("fail");
			} else {
				out.write("success");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/nickCheck")
	public void nickCheck(String nickname, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			
			Member m = mService.selectMemberByNickname(nickname);
			
			System.out.println(m);
			
			if(m != null) {
				out.write("fail");
			} else {
				out.write("success");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/nsignUp")
	public String insertnMember(@ModelAttribute M_Normal m,
					            @RequestParam("address") String address,
					            @RequestParam("address1") String address1,
					            @RequestParam("address2") String address2,
					            @RequestParam("nickname") String nickname,
					            Model model,
					            RedirectAttributes rd) {
		
		m.setAddr(address + "," + address1 + "," + address2);
		System.out.println(m);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		m.setGrade("N");
		m.setNickname(nickname);
		
		int result = mService.insertnMember(m);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원 가입이 완료 되었습니다. 로그인 해주세요.");
			return "redirect:/member/loginView";
		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			return "member/signUp_N";
		}
		
	}
}
