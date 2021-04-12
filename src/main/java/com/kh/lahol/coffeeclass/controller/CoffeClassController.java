package com.kh.lahol.coffeeclass.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.coffeeclass.model.exception.CoffeeClassException;
import com.kh.lahol.coffeeclass.model.service.CoffeeClassSerivce;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;
import com.kh.lahol.coffeeclass.page.Pagination;

@Controller
public class CoffeClassController {

	@Autowired
	private CoffeeClassSerivce clService;

	// 사용자 메인페이지

	@GetMapping("/coffeeclass")
	public ModelAndView coffeeClassList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) { // 메뉴바 클릭시 파라미터가 따로
																									// 없으므로 1로 설정(1페이지)

		int listCount = clService.selectListCount(); // 게시글 갯수

		// 요청 페이지에 맞는 클래스 리스트 조회
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<CoffeeClass> list = clService.selectList(pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("coffeeclass/class_main");
		} else {
			mv.addObject("msg", "클래스 페이지에 접근할 수 없습니다.");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}
	
	// 클래스 개설 페이지로 이동
	@GetMapping("/coffeeclass/createclass")
	public String createclass() {
		return "coffeeclass/bus_create";
	}
	
	// 클래스 개설
	@PostMapping("/coffeeclass/createclass/insert")
	public String classInsert(@ModelAttribute CoffeeClass cl, 
							  @RequestParam(name="imgfile1") MultipartFile file1,
							  @RequestParam(name="imgfile2") MultipartFile file2,
							  @RequestParam(name="imgfile3") MultipartFile file3,
							  @RequestParam(name="classLoca1") String classlocation1,
							  @RequestParam(name="classLoca2") String classlocation2,
							  HttpServletRequest request) throws CoffeeClassException {
		
		// 주소 세팅
		cl.setClassLoca(classlocation1 + classlocation2);
		
		
		 if(!file1.getOriginalFilename().equals("")) {
	            // 파일 저장 메소드 별도로 작성 - 리네임명 리턴
	            String renameFileName = saveFile(file1, (HttpServletRequest) request);
	            
	            // DB에 저장하기 위한 파일명 세팅
	            if(renameFileName != null) {
	               cl.setTrPhoto(renameFileName);
	            }

	         }
		 
		 if(!file2.getOriginalFilename().equals("")) {
	            // 파일 저장 메소드 별도로 작성 - 리네임명 리턴
	            String renameFileName = saveFile(file2, (HttpServletRequest) request);
	            
	            // DB에 저장하기 위한 파일명 세팅
	            if(renameFileName != null) {
	               cl.setClThumbnail(renameFileName);
	            }

	         }
		 
		 if(!file3.getOriginalFilename().equals("")) {
	            // 파일 저장 메소드 별도로 작성 - 리네임명 리턴
	            String renameFileName = saveFile(file3, (HttpServletRequest) request);
	            
	            // DB에 저장하기 위한 파일명 세팅
	            if(renameFileName != null) {
	               cl.setClPhoto(renameFileName);
	            }

	         }
		
		System.out.println(cl);
		
		int result = clService.insertClass(cl);
		
		if(result > 0) {
			return "coffeeclass/class_main";
		}else {
			System.out.println("클래스 등록에 실패하셨습니다.");
		}

		
		return "";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
        String root = request.getSession().getServletContext().getRealPath("resources");
        String savePath = root + "\\nuploadFiles\\classImg";
        File folder = new File(savePath); // 메모리상에서 객체 파일 만들기 
        if(!folder.exists()) {
           folder.mkdir(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
        }
        
        // 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String originalFileName = file.getOriginalFilename();
        String renameFileName = sdf.format(new Date()) + "_"
                       + (int)(Math.random() * 100000)
                       + originalFileName.substring(originalFileName.lastIndexOf("."));
        
        String renamePath = folder + "\\" + renameFileName; // 저장하고자하는 경로 + 파일명
        
        
        try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}

        
        return renameFileName;
     }
	
	
	
	
	

	/*
	 * // 클래스 상세 페이지
	 * 
	 * @GetMapping("/coffeeclass/classdetail") public String classDetail(String
	 * classNo, HttpServletRequest request, HttpServletResponse response, Model
	 * model) {
	 * 
	 * boolean flagcllist = false; // cllist라는 이름의 쿠키가 있는지 확인 boolean flagclassNo =
	 * false;// 해당 classNo가 포함되어 있는지 확인
	 * 
	 * Cookie [] cookies = request.getCookies();
	 * 
	 * try { if(cookies != null) { for(Cookie c:cookies) { // 들어간 클래스의 classNo를 모아서
	 * 보관하는 cllist라는 쿠키 안에 있다면 if(c.getName().equals("cllist")) { flagcllist = true;
	 * // 기존 쿠키 값 먼저 읽어옴(, 등의 특수문자 인코딩 때문에 decode처리) String cllist =
	 * URLDecoder.decode(c.getValue(), "UTF-8"); // , 구분자 기준으로 나누기 String [] list =
	 * cllist.split(","); // list안에 내가 본 cllist가 있는지 없는지 확인 for(String st : list) {
	 * // 쿠키 안에 지금 클릭한 게시글의 classNo가 있다면 => true
	 * if(st.equals(String.valueOf(classNo))) flagclassNo = true; } if(!flagclassNo)
	 * { c.setValue(URLEncoder.encode(cllist + "," + classNo, "UTF-8"));
	 * response.addCookie(c); // 응답에 담아 보냄 } } } if(!flagcllist) { // cllist라는 쿠키가
	 * 만들어지지 않은 경우 Cookie c1 = new Cookie("cllist",
	 * URLEncoder.encode(String.valueOf(classNo), "UTF-8")); response.addCookie(c1);
	 * } } } catch (UnsupportedEncodingException e) { e.printStackTrace(); }
	 * 
	 * CoffeeClass cl = clService.selectCoffeeClass(classNo, !flagclassNo);
	 * 
	 * if(cl != null) { model.addAttribute("cl", cl); return
	 * "coffeeclass/class_detail"; } else { model.addAttribute("msg",
	 * "게시글 상세보기에 실패했습니다."); return "common/error"; } }
	 */
	/*
	 * public String classdetail() { return "coffeeclass/class_detail"; }
	 */
	
	

 
	 // 사업자 커피클래스 메인 페이지
	  
		
		  @GetMapping("/coffeeclass/busmain") public String busmain() { return
		  "coffeeclass/bus_classmain"; }
		 
	  
	// 사업자 커피클래스 상세 페이지
		
	/*
	 * @GetMapping("/coffeeclass/busdetail") public String busdetail() { return
	 * "coffeeclass/bus_classdetail"; }
	 */
	  
	  
	  
	  
	  
	  
	  
	  
	  
	 
}
