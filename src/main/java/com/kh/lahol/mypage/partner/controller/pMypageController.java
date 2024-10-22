package com.kh.lahol.mypage.partner.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.common.Pagination;
import com.kh.lahol.mypage.partner.model.service.pMypageService;
import com.kh.lahol.mypage.partner.model.vo.Ad;
import com.kh.lahol.mypage.partner.model.vo.CoffeeClass;
import com.kh.lahol.mypage.partner.model.vo.Payment;
import com.kh.lahol.mypage.partner.model.vo.Search;
import com.kh.lahol.mypage.partner.model.vo.Shipping;
import com.kh.lahol.mypage.partner.model.vo.StoreStats;

@Controller
@RequestMapping("/pMypage")
@SessionAttributes({"loginUser"})
public class pMypageController {
	@Autowired
	private pMypageService pService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/homeView")
	public String homeView() {
		return "mypage/partner/p-mypage";
	}
	
	@GetMapping("/updateView")
	public String updateView() {
		return "mypage/partner/updateMember";
	}
	
	@GetMapping("/classView")
	public String classView(Model model,
			                @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			                HttpServletRequest request) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
		
		int classListCount = pService.classListCount(id);
		
		if(classListCount > 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, classListCount);
			List<CoffeeClass> list = pService.selectClassList(id, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("cl_list", "조회된 클래스 현황이 없습니다.");
		}
		
		return "mypage/partner/classList";
	}
	
	@GetMapping("/deleteView")
	public String deleteView() {
		return "mypage/partner/deleteMember";
	}
	
	@GetMapping("/storeView")
	public String storeView(Model model,
			                @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			                HttpServletRequest request) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
		
		int payStoreListCount = pService.payStoreListCount(id);
		
		if(payStoreListCount > 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, payStoreListCount);
			List<StoreStats> list = pService.selectPayStoreList(id, pi);
			int sumPriceTotal = pService.selectSumPayStore(id, "");
			int storePriceTotal = pService.selectSumPayStore(id, "STP");
			int classPriceTotal = pService.selectSumPayStore(id, "CL");
			int cafePriceTotal = pService.selectSumPayStore(id, "CAP");
			Map<String, Integer> map = new HashMap<>();
			map.put("sumPriceTotal", sumPriceTotal);
			map.put("storePriceTotal", storePriceTotal);
			map.put("classPriceTotal", classPriceTotal);
			map.put("cafePriceTotal", cafePriceTotal);
			map.put("count", payStoreListCount);
			model.addAttribute("map", map);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("payList", "판매된 내역이 없습니다.");
		}
		
		return "mypage/partner/manageStore";
	}
	
	@GetMapping("/searchStore")
	public String searchStore(Model model,
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
			return "redirect:/pMypage/storeView";
		}
		int searchPayStoreCount = pService.searchPayStoreCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, searchPayStoreCount);
		if(searchPayStoreCount > 0) {
			List<StoreStats> list = pService.searchPayStoreList(search, pi);
			Map<String, Integer> map = new HashMap<>();
			// 전체 판매 금액
			int sumPriceTotal = pService.selectSumPayStore(id, "");
			int storePriceTotal = pService.selectSumPayStore(id, "ST");
			int classPriceTotal = pService.selectSumPayStore(id, "CL");
			int cafePriceTotal = pService.selectSumPayStore(id, "CA");
			map.put("sumPriceTotal", sumPriceTotal);
			map.put("storePriceTotal", storePriceTotal);
			map.put("classPriceTotal", classPriceTotal);
			map.put("cafePriceTotal", cafePriceTotal);
			
			// 기간별 판매 금액
			int sumPrice = pService.searchSumPayStore(search, "");
			int storePrice = pService.searchSumPayStore(search, "ST");
			int classPrice = pService.searchSumPayStore(search, "CL");
			int cafePrice = pService.searchSumPayStore(search, "CA");
			map.put("sumPrice", sumPrice);
			map.put("storePrice", storePrice);
			map.put("classPrice", classPrice);
			map.put("cafePrice", cafePrice);
			
			// 카테고리 포함 판매 금액
			int sumPriceCategory = pService.searchSumPayStore(search, search.getSearchCondition());
			map.put("sumPriceCategory", sumPriceCategory);
			map.put("count", searchPayStoreCount);
			model.addAttribute("map", map);
			model.addAttribute("list", list);
			model.addAttribute("search", search);
			model.addAttribute("pi", pi);
			return "mypage/partner/manageStore";
		} else {
			rd.addFlashAttribute("msg", "기간별 조회에 실패하였습니다.");
			return "redirect:/pMypage/storeView";
		}
		
	}
	
	
	@GetMapping("/orderView")
	public String orderView(@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			                Model model,
			                HttpServletRequest request) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
		
		int orderListCount = pService.orderListCount(id);
		
		if(orderListCount > 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, orderListCount);
			List<Shipping> list = pService.selectOrderList(id, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("order", "주문 내역이 없습니다.");
		}
		
		return "mypage/partner/orderList";
	}
	
	@GetMapping("/adView")
	public String adView(@RequestParam(value="ad_code", required=false, defaultValue="") String ad_code,
			             Model model) {
		if(!ad_code.equals("")) {
			Ad ad = pService.selectAdByCode(ad_code);
			model.addAttribute("ad", ad);
		}
		return "mypage/partner/adMain";
	}
	
	@GetMapping("/adListView")
	public String adListView(Model model,
			                 @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			                 HttpServletRequest request) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
		
		int adListCount = pService.adListCount(id);
		
		if(adListCount > 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, adListCount);
			List<Ad> list = pService.selectAdList(id, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("ad", "광고를 신청한 내역이 없습니다");
		}
		return "mypage/partner/adList";
	}
	
	@PostMapping("/checkDelete")
	public String checkDelete(@ModelAttribute Member m,
			                  Model model) {
		Member member = pService.selectMember(m);
		
		if(member != null && bcryptPasswordEncoder.matches(m.getPwd(), member.getPwd())) {
			return "mypage/partner/confirmDeleteMember";
		} else {
			model.addAttribute("msg", "비밀번호가 일치 하지 않습니다.");
			return "mypage/partner/deleteMember";
		}
	}
	
	@PostMapping("/delete")
	public String deleteMember(@RequestParam("id") String id,
			                   Model model,
			                   SessionStatus status,
			                   RedirectAttributes rd) {
		int result = pService.deleteMember(id);
		
		if(result > 0) {
			status.setComplete();
			rd.addFlashAttribute("msg", "정상적으로 탈퇴 되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패하였습니다.");
			return "mypage/partner/deleteMember";
		}
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
		m.setGrade("P");
		int result = pService.updateMember(m);
		if(result > 0) {
			Member loginUser = pService.selectMember(m);
			System.out.println(loginUser);
			if(loginUser != null) {
				model.addAttribute("loginUser", loginUser);
				rd.addFlashAttribute("msg", "회원 정보가 수정 되었습니다.");
				return "redirect:/pMypage/homeView";
			} else {
				model.addAttribute("msg", "로그인 정보를 불러오지 못했습니다.");
				return "mypage/partner/updateMember";
			}
		} else {
			model.addAttribute("msg", "회원정보 수정에 실패하였습니다.");
			return "mypage/partner/updateMember";
		}
	}
	
	@PostMapping("/adDate")
	public String adDate(@RequestParam("day") String day,
				         @ModelAttribute Ad ad,
			             Model model) {
		model.addAttribute("day", day);
		Boolean reAd = false;
		if(!ad.getAd_code().equals("")) {
			reAd = true;
			model.addAttribute("ad", ad);
			model.addAttribute("reAd", reAd);
		}
		
		return "mypage/partner/adImageUpload";
	}
	
	@PostMapping("/adImage")
	public String adImage(@ModelAttribute Ad ad,
			              @RequestParam(value="banner-img") MultipartFile file,
			              @RequestParam("day") String day,
			              @RequestParam(value="reAd", required=false, defaultValue="false") Boolean reAd,
			              HttpServletRequest request,
			              Model model) {
		if(ad.getRename_image() != null) {
			deleteFile(ad.getRename_image(), request);
		}
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			String root = request.getSession().getServletContext().getContextPath();
			String savePath = root + "/resources/muploadFiles/banner";
			ad.setOrigin_image(file.getOriginalFilename());
			ad.setImage(savePath + "/" + renameFileName);
			ad.setRename_image(renameFileName);
			model.addAttribute("day", day);
			model.addAttribute("ad", ad);
			if(reAd) {
				model.addAttribute("reAd", reAd);
			}
			return "mypage/partner/adURL";
		} else {
			model.addAttribute("msg", "이미지 업로드에 실패하였습니다.");
			return "mypage/partner/adImageUpload";
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/muploadFiles/banner";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
				              + (int)(Math.random() * 100000)
				              + originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}
		
		return renameFileName;
	}
	
	public void deleteFile(String rename_image, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		File deleteFile = new File(root + "/muploadFiles/banner/" + rename_image);
		
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	@PostMapping("/adUrl")
	public String adUrl(@ModelAttribute Ad ad,
			            @RequestParam("day") String day,
			            @RequestParam(value="reAd", required=false, defaultValue="false") Boolean reAd,
			            Model model,
			            RedirectAttributes rd) {
		if(!reAd) {
			model.addAttribute("ad", ad);
			model.addAttribute("day", day);
			return "mypage/partner/adPayView";
		} else {
			ad.setAd_reject(day);
			int result = pService.updateAd(ad);
			
			if(result > 0) {
				return "mypage/partner/adResult";
			}
			rd.addFlashAttribute("msg", "광고 재신청에 실패했습니다.");
			return "redirect:/pMypage/adListView";
		}
		
	}
	
	@PostMapping("/adPay")
	public String adPay(@ModelAttribute Ad ad,
			            @RequestParam("day") String day,
			            @RequestParam("price") String price,
			            @RequestParam("bn_name") String bn_name,
			            Model model,
			            HttpServletRequest request){
		// day는 applyDate이지만, 자료형을 맞추기위해 임시로 담아 sql문에서 TO_DATE로 처리
		ad.setAd_reject(day);
		System.out.println("insert Ad : " + ad);
		int result = pService.insertAd(ad);
		
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
		
		if(result > 0) {
			Payment pay = new Payment();
			pay.setPay_price(price);
			pay.setPay_item(bn_name);
			pay.setAd_code(ad.getAd_code());
			pay.setId(id);
			int result2 = pService.insertPayment(pay);
			if(result2 > 0) {
				return "mypage/partner/adResult";
			} else {
				model.addAttribute("msg", "결제 내역 등록에 실패하였습니다.");
				return "mypage/partner/adMain";
			}
		} else {
			model.addAttribute("msg", "배너 신청 등록에 실패했습니다.");
			return "mypage/partner/adMain";
		}
		
	}
	
	@GetMapping("/adDetail")
	public String adDetail(Model model,
			               @RequestParam("ad_code") String ad_code,
			               @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			               RedirectAttributes rd) {
		Ad ad = pService.selectAdByCode(ad_code);
		if(ad != null) {
			model.addAttribute("ad", ad);
			return "mypage/partner/adReject";
		} else {
			rd.addFlashAttribute("msg", "광고 신청 내역 조회에 실패하였습니다.");
			return "redirect:/pMypage/adListView";
		}
	}
	
	@GetMapping("/classMember")
	public String classMember(Model model,
			                  @RequestParam("class_no") String class_no,
			                  @RequestParam("cl_time") String cl_time,
			                  @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		List<String> str = new ArrayList<>();
		str.add(class_no);
		str.add(cl_time);
		
		int classMemberCount = pService.selectClassMemberCount(str);
		CoffeeClass cl = pService.selectClassByNo(class_no);
		model.addAttribute("class_name", cl.getCl_name());
		
		if(classMemberCount > 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, classMemberCount);
			
			List<Member> list = pService.selectClassMember(str, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("cl_list", "조회된 신청자가 없습니다.");
		}
		
		return "mypage/partner/classMemberList";
	}
	
	@PostMapping(value="/updateShipping", produces="application/json; charset=utf-8")
	public @ResponseBody String updateShipping(String code, String val, String subCode, HttpServletResponse response, HttpServletRequest request) {
		Shipping ship = new Shipping();
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();

		String status = "";
		if(val.equals("ready")) {
			status = "상품준비중";
		} else if(val.equals("transfer")) {
			status = "상품인계";
		} else if(val.equals("ship")) {
			status = "상품배송중";
		} else {
			status = "배송완료";
		}
		
		int result = pService.updateShipping(code, status);
		if(result > 0) {
			ship.setShipping_code(code);
			ship.setId(id);
			if(status.equals("배송완료")) {
				int result1 = pService.updateDelivery(subCode);
			}
			Shipping updateShip = pService.selectShip(ship);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			return gson.toJson(updateShip);
		} else {
			return null;
		}
	}
	
	@GetMapping(value="/selectAd", produces="application/json; charset=utf-8")
	public @ResponseBody String selectAd() {
		List<Ad> list = pService.selectAdAll();
		
		if(list != null) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			return gson.toJson(list);
		} else {
			return null;
		}
		
	}
}
