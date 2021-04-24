package com.kh.lahol.mypage.normal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.common.Pagination;
import com.kh.lahol.mypage.normal.model.service.nMypageService;
import com.kh.lahol.mypage.normal.model.vo.ClassDetail;
import com.kh.lahol.mypage.normal.model.vo.Coupon;
import com.kh.lahol.mypage.normal.model.vo.PayList;
import com.kh.lahol.mypage.partner.model.vo.Search;

@Controller
@RequestMapping("/nMypage")
@SessionAttributes({"loginUser"})
public class nMypageController {
	@Autowired
	private nMypageService nService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/homeView")
	public String homeView() {
		return "mypage/normal/mypage";
	}
	
	@GetMapping("/updateView")
	public String updateView() {
		return "mypage/normal/updateMember";
	}
	
	@GetMapping("/paymentView")
	public String paymentView(@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			                  Model model,
			                  HttpServletRequest request) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
		int payListCount = nService.selectPayListCount(id);
		
		if(payListCount > 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, payListCount);
			List<PayList> list = nService.selectPayList(id, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("payList", "구매 내역이 없습니다.");
		}
		
		return "mypage/normal/paymentList";
	}
	
	@GetMapping("/couponView")
	public String couponView(Model model,
			                 @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			                 HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		int couponCount = nService.selectCouponCount(id);
		
		if(couponCount > 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, couponCount);
			List<Coupon> list = nService.selectCouponList(id, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("coupon", "보유한 쿠폰이 없습니다.");
		}
		
		return "mypage/normal/couponList";
	}
	
	@GetMapping("/interestView")
	public String interestView() {
		return "mypage/normal/interestList";
	}
	
	@GetMapping("/deleteView")
	public String deleteView() {
		return "mypage/normal/deleteMember";
	}
	
	@PostMapping("/update")
	public String updateMember(@ModelAttribute Member m,
			                   @RequestParam("address1") String address1,
			                   @RequestParam("address2") String address2,
			                   @RequestParam("address3") String address3,
			                   Model model,
			                   RedirectAttributes rd) {
		m.setAddr(address1 + "," + address2 + "," + address3);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		m.setGrade("N");
		int result = nService.updateMember(m);
		if(result > 0) {
			Member loginUser = nService.selectMember(m);
			System.out.println(loginUser);
			if(loginUser != null) {
				model.addAttribute("loginUser", loginUser);
				rd.addFlashAttribute("msg", "회원 정보가 수정 되었습니다.");
				return "redirect:/";
			} else {
				model.addAttribute("msg", "로그인 정보를 불러오지 못했습니다.");
				return "mypage/normal/updateMember";
			}
		} else {
			model.addAttribute("msg", "회원정보 수정에 실패하였습니다.");
			return "mypage/normal/updateMember";
		}
	}
	
	@PostMapping("/checkDelete")
	public String checkDelete(@ModelAttribute Member m,
			                  Model model) {
		Member member = nService.selectMember(m);
		
		if(member != null && bcryptPasswordEncoder.matches(m.getPwd(), member.getPwd())) {
			return "mypage/normal/confirmDeleteMember";
		} else {
			model.addAttribute("msg", "비밀번호가 일치 하지 않습니다.");
			return "mypage/normal/deleteMember";
		}
	}
	
	@PostMapping("/delete")
	public String deleteMember(@RequestParam("id") String id,
			                   Model model,
			                   SessionStatus status,
			                   RedirectAttributes rd) {
		int result = nService.deleteMember(id);
		
		if(result > 0) {
			status.setComplete();
			rd.addFlashAttribute("msg", "정상적으로 탈퇴 되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패하였습니다.");
			return "mypage/normal/deleteMember";
		}
	}
	
	@GetMapping("/searchPayment")
	public String searchPayment(Model model,
					            @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
					            @ModelAttribute Search search,
					            HttpServletRequest request,
					            RedirectAttributes rd) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
		search.setId(id);
		if(search.getSearch().equals("selection")) {
			search.setSearch(null);
		} else if(search.getSearch().equals("")) {
			rd.addFlashAttribute("msg", "검색 기간을 선택해주세요.");
			return "redirect:/nMypage/paymentView";
		}
		
		int searchPaymentCount = nService.searchPaymentCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, searchPaymentCount);
		if(searchPaymentCount > 0) {
			List<PayList> list = nService.searchPaymentList(search, pi);
			model.addAttribute("list", list);
			model.addAttribute("search", search);
			model.addAttribute("pi", pi);
			return "mypage/normal/paymentList";
		} else {
			rd.addFlashAttribute("msg", "기간별 조회에 실패하였습니다.");
			return "redirect:/nMypage/paymentView";
		}
	}
	
	@GetMapping("/detailClass")
	public String detailClass(@RequestParam("pay_no") String pay_no,
			                  Model model,
			                  RedirectAttributes rd) {
		ClassDetail classDetail = nService.selectClass(pay_no);
		if(classDetail != null) {
			model.addAttribute("detail", classDetail);
			return "mypage/normal/paymentDetailClass";
		} else {
			rd.addFlashAttribute("msg", "상세 조회에 실패하였습니다.");
			return "redirect:/nMypage/paymentView";
		}
	}
}
