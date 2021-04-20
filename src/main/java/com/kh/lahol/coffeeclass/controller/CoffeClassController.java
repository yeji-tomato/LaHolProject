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
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.lahol.cafe.bus.model.service.CafeBizService;
import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.coffeeclass.model.exception.CoffeeClassException;
import com.kh.lahol.coffeeclass.model.service.CoffeeClassSerivce;
import com.kh.lahol.coffeeclass.model.vo.ClassRegister;
import com.kh.lahol.coffeeclass.model.vo.ClassSearch;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;
import com.kh.lahol.coffeeclass.page.Pagination;
import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.store.model.vo.Search;
import com.kh.lahol.store.model.vo.storeA;
import com.kh.lahol.store.model.vo.storeQ;
import com.kh.lahol.store.page.Pagination3;



@Controller
@SessionAttributes({"loginUser"})
public class CoffeClassController {

	@Autowired
	private CoffeeClassSerivce clService;
	@Autowired
	private CafeBizService cafeService;
	

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
	
	  
	// 검색 기능
	@GetMapping("coffeeclass/search")
	public String searchClass(@ModelAttribute ClassSearch search,
							  Model model) {
		  
		List<ClassSearch> searchList = clService.searchList(search);
		
		model.addAttribute("list", searchList);
		
		return "coffeeclass/class_main";
	}
	
	
	// 필터 기능
	@GetMapping("/coffeeclass/filter")
	public String filterClass(@ModelAttribute ClassSearch search,
							   Model model) {
		
		List<ClassSearch> filterList = clService.filterList(search);
		
		model.addAttribute("list", filterList);
		
		return "coffeeclass/class_main";
		
	}
	
	
	
	// 클래스 개설 페이지로 이동
	@GetMapping("/coffeeclass/createclass")
	public String createclass(Model model) {
		/*
		 * Cafe cafe = new Cafe(); cafe.setCaName("만랩커피");
		 */
		Cafe cafe = cafeService.selectCafeInfo("CA21");
		// User loginUser = session.getAttribute("loginUSer(키값)") 을 통해서 controller에서 가지고 나온다  
		// selectMyCafe라는 메소드 만들고, 
		// Cafe mycafe = cafeService.selectMyCafe(loginUser);
		model.addAttribute("mycafe", cafe);
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
		
		// 사진 넘겨주기
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
			return "redirect:/coffeeclass";
		}else {
			System.out.println("클래스 등록에 실패하셨습니다.");
		}

		
		return "";
	}
	
	// 사진 저장
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
	  
	  
	  // 클래스 상세페이지
	  @GetMapping("/coffeeclass/classdetail")	// coffeeclass라는 타입을 저장을 해서 forwarding하는거라 model객체 필요
	  public String classdetail(@RequestParam String classNo,
			  					Model model,
			  					HttpServletRequest request) {
		  
		  CoffeeClass cl = clService.selectCoffeeClass(classNo);
		  
		  if(cl != null) {	    //키값 : 뷰에서 보여질 변수명, 밸류: 컨트롤러에서 실제 쓰이는 변수명
			  model.addAttribute("coffeeclass", cl);
				/*
				 * String classTimeStr= cl.getClassTime(); 
				 * String[] classTimeArr = classTimeStr.split(",");
				 * >> 객체안에 메소드로 넣어버림
				 */ 
			  model.addAttribute("classTimes", cl.bringTimes());
			  return "coffeeclass/class_detail";
		  } else {
			  model.addAttribute("errorMsg", "클래스를 불러오는데 실패했습니다.");
			  return "common/error";
		  }
		  
			
		  
	    }
	  
  	  // 클래스 신고
	  @PostMapping("/coffeeclass/classreport")
	  public String classReport(@ModelAttribute CoffeeClass cl,
							  Model model) {
	
	  int result = clService.reportClass(cl);
	 		
	  if(result > 0) {
		 return "redirect:/coffeeclass/classdetail?classNo=" + cl.getClassNo(); 
	  } else {	
		return "common/error";
	  }
			
	  }
		
	
	  
	  // 사업자 커피클래스 메인 페이지
	  @GetMapping("/coffeeclass/busmain")
	  public String busmain() { 
		  return "coffeeclass/bus_classmain"; 
	  }
	  
	  
	  // 사업자 클래스 상세 페이지
	  @GetMapping("/coffeeclass/busdetail") 
	  public String busdetail() {
		  return "coffeeclass/bus_classdetail"; 
	  }
	  
	  
	  // 클래스 수정 페이지로 이동
	  @GetMapping("/coffeeclass/updateclass")
	  public String updateClass(@RequestParam String classNo, Model model) {
		 
		  CoffeeClass cl = clService.bringClassInfo(classNo);
		  
		  System.out.println(classNo);
		  
		                // view에서 보여질 변수명, 컨트롤러 변수명
		  model.addAttribute("coffeeclass", cl);
		  // 주소 잘라서 가져오기
		  model.addAttribute("clAddresses", cl.bringAddress());
		  // 강의 시간 잘라서 가져오기
		  model.addAttribute("classTimes", cl.bringTimes());
		
		  return "coffeeclass/bus_classupdate";
		
	  }
	

	  // 클래스 수정
	  @PostMapping("/coffeeclass/updateclass/update")
	  public String update(@ModelAttribute CoffeeClass cl,
						   @RequestParam(name="imgfile1") MultipartFile file1,
						   @RequestParam(name="imgfile2") MultipartFile file2,
						   @RequestParam(name="imgfile3") MultipartFile file3,
						   @RequestParam(name="classLoca1") String classlocation1,
						   @RequestParam(name="classLoca2") String classlocation2,
						   HttpServletRequest request) {
		  
			// 주소 세팅
			cl.setClassLoca(classlocation1 + " " + classlocation2);
		
			// 이미지 변경
			if(!file1.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				if(cl.getTrPhoto() != null) {
					deleteFile(cl.getTrPhoto(), request);
				}
				
				String renameFileName = saveFile(file1, request);
				
				if(renameFileName != null) {
					cl.setTrPhoto(renameFileName);
				}
			}
			
			if(!file2.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				if(cl.getClThumbnail() != null) {
					deleteFile(cl.getClThumbnail(), request);
				}
				
				String renameFileName = saveFile(file2, request);
				
				if(renameFileName != null) {
					cl.setClThumbnail(renameFileName);
				}
			}
			
			if(!file3.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				if(cl.getClPhoto() != null) {
					deleteFile(cl.getClPhoto(), request);
				}
				
				String renameFileName = saveFile(file3, request);
				
				if(renameFileName != null) {
					cl.setClPhoto(renameFileName);
				}
			}	

			  int result = clService.updateClass(cl);
			  
			  if(result > 0) { return "redirect:/coffeeclass"; }
			  else { 
				  throw new CoffeeClassException("수정실패"); 
				  }
			
	  }
	  
	   // 등록한 파일 삭제
	  @PostMapping("coffeeclass/deleteFile")
	  public String deleteFile(String filePath, HttpServletRequest request) {
		  
		  String root = request.getSession().getServletContext().getRealPath("resources");
		  
		  File deleteFile = new File(root + filePath);
		  
		  if(deleteFile.exists())
			  deleteFile.delete();
		  
		  return "";
	  }
	  
	 

	  
	  // 클래스 삭제 > 실제 삭제는 아니고 CL_STATUS를 'D'로 변경할 것
	  @GetMapping("/coffeeclass/deleteClass")
	  public String deleteClass(@ModelAttribute CoffeeClass cl, 
			  					HttpServletRequest request,
		  						Model model,
		  						RedirectAttributes rd) {
		 
		  
		  int result = clService.deleteClass(cl);
		  
		  if(result > 0) {
			  rd.addFlashAttribute("msg", "클래스 삭제가 완료되었습니다.");
			  return "coffeeclass/class_main";
		  } else {
			  model.addAttribute("msg", "클래스 삭제에 실패했습니다.");
			  return "";
		  }
		  
	  }
	  
	
	  // 클래스 수강신청
	  @PostMapping("/coffeeclass/register")
	  							// ajax사용시
	  public String registerClass(@RequestBody ClassRegister clRegi,			  					
			  					   Model model) {
		  System.out.println(clRegi);
		  int result = clService.registerClass(clRegi); 
		  if(result > 0) {
			  return "coffeeclass/class_detail";
		  } else {
			  model.addAttribute("msg", "결제에 실패하였습니다.");
			  return "common/error";
		  } 
		 
	  }
	 
	
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	 
}
