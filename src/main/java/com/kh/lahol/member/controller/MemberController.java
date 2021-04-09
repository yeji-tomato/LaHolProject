package com.kh.lahol.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.lahol.member.model.service.MemberService;
import com.kh.lahol.member.model.vo.Cafe;
import com.kh.lahol.member.model.vo.M_Normal;
import com.kh.lahol.member.model.vo.M_Partner;
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
	
	@PostMapping("/psignUp")
	public String insertpMember(@ModelAttribute M_Partner m,
			                    @ModelAttribute Cafe c,
								@RequestParam("address") String address,
					            @RequestParam("address1") String address1,
					            @RequestParam("address2") String address2,
					            @RequestParam("cNumber1") String cNumber1,
					            @RequestParam("cNumber2") String cNumber2,
					            @RequestParam("cNumber3") String cNumber3,
					            @RequestParam("cAddress") String cAddress,
					            @RequestParam("cAddress1") String cAddress1,
					            @RequestParam("cAddress2") String cAddress2,
					            @RequestParam("c_la") String c_la,
					            @RequestParam("c_lo") String c_lo,
					            HttpServletRequest request,
					            Model model,
					            RedirectAttributes rd) {
		m.setAddr(address + "," + address1 + "," + address2);
		System.out.println(m);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		m.setGrade("P");
		
		c.setC_address(cAddress + "," + cAddress1 + "," + cAddress2);
		c.setC_number(cNumber1 + "-" + cNumber2 + "-" + cNumber3);
		System.out.println(c);
		
		if(c_la.equals("")) {
			model.addAttribute("msg", "주소 정보 호출에 실패하였습니다.");
			return "member/signUp_P";
		} else {
			int result1 = mService.insertpMember(m);
			
			if(result1 > 0) {
				if(!c.getC_name().equals("")) {
					int result2 = mService.insertCafe(c);
					
					if(result2 > 0) {
						rd.addFlashAttribute("msg", "회원 가입이 완료 되었습니다. 로그인 해주세요.");
						return "redirect:/member/loginView";
					} else {
						model.addAttribute("msg", "회원가입에 실패하였습니다.");
						return "member/signUp_P";
					}
				} else {
					rd.addFlashAttribute("msg", "회원 가입이 완료 되었습니다. 로그인 해주세요.");
					return "redirect:/member/loginView";
				}
			} else {
				model.addAttribute("msg", "회원가입에 실패하였습니다.");
				return "member/signUp_P";
			}
		}
		
	}
	
	@PostMapping("/login")
	public String memberLogin(@ModelAttribute Member m,
			                  Model model) {
		Member loginUser = mService.selectMember(m.getId());
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			System.out.println(loginUser);
			return "redirect:/";
		} else {
			model.addAttribute("msg", "로그인에 실패하였습니다.");
			return "member/loginView";
		}
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/mypageView")
	public String mypageView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("loginUser");
		
		if(m.getGrade().equals("N")) {
			return "mypage/normal/mypage";
		} else if(m.getGrade().equals("P")) {
			return "mypage/partner/p-mypage";
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/idSearch")
	public String idSearchView() {
		return "member/searchId";
	}
	
	@GetMapping("/pwdSearch")
	public String pwdSearchView() {
		return "member/searchPwd";
	}
	
}
