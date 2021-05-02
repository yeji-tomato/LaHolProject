package com.kh.lahol.coffeeclass.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.lahol.cafe.bus.model.service.CafeBizService;
import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.coffeeclass.model.exception.CoffeeClassException;
import com.kh.lahol.coffeeclass.model.service.CoffeeClassSerivce;
import com.kh.lahol.coffeeclass.model.vo.ClassQnA;
import com.kh.lahol.coffeeclass.model.vo.ClassRegister;
import com.kh.lahol.coffeeclass.model.vo.ClassSearch;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;
import com.kh.lahol.coffeeclass.page.Pagination;
import com.kh.lahol.common.model.vo.Payment;
import com.kh.lahol.common.model.vo.Report;
import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.normal.model.vo.ClassReview;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@SessionAttributes({"loginUser", "selectedTimes"})
public class CoffeClassController {

	@Autowired
	private CoffeeClassSerivce clService;
	@Autowired
	private CafeBizService cafeService;
	@Autowired 
	private CafeBizService caBizService;
	

	// 사용자 메인페이지
	@GetMapping("/coffeeclass")
	public ModelAndView coffeeClassList(ModelAndView mv, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) { // 메뉴바 클릭시 파라미터가 따로
																									// 없으므로 1로 설정(1페이지)

		// 게시글 갯수 구하기
		int listCount = clService.selectListCount(); 
		System.out.println(listCount);

		// 요청 페이지에 맞는 클래스 리스트 조회
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); // currentPage - 현재 페이지, listCount - 총 게시글 수
		List<CoffeeClass> list = clService.selectList(pi);
		System.out.println(list);

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
		if(searchList.size() == 0) {
			String nothing = String.format("%s에 대한 검색 결과가 없습니다.", search.getSearchValue());
			model.addAttribute("nothing", nothing);
		}
		model.addAttribute("list", searchList);
		
		return "coffeeclass/class_main";
	}
	
	
	// 필터 기능
	@GetMapping("/coffeeclass/filter")
	public String filterClass(@ModelAttribute ClassSearch search,
							   Model model) {
		
		
		System.out.println(search);

		List<ClassSearch> filterList = clService.filterList(search);
		
		model.addAttribute("list", filterList);
		
		
		return "coffeeclass/class_main";
		
	}
	
	
	
	// 클래스 개설 페이지로 이동
	@GetMapping("/coffeeclass/createclass")
											// 세션의 값을 불러오긴 위해 
	public String createclass(Model model, HttpServletRequest request) {
		/*
		 * Cafe cafe = new Cafe(); cafe.setCaName("만랩커피");
		 */
		// Cafe cafe = cafeService.selectCafeInfo("CA21");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser"); // 을 통해서 controller에서 가지고 나온다
		Cafe cafe = clService.selectCafeInfoById(loginUser.getId());
		
		// selectMyCafe라는 메소드 만들고, 
		//Cafe mycafe = cafeService.selectMyCafe(loginUser);
		
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
        String savePath = root + "/nuploadFiles/classImg";
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
        
        String renamePath = folder + "/" + renameFileName; // 저장하고자하는 경로 + 파일명
        
        
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
			  					@ModelAttribute ClassQnA classqna,
			  					Model model,
			  					HttpServletRequest request) {
		  
		  CoffeeClass cl = clService.selectCoffeeClass(classNo);
		  
		  // QnA리스트 출력
		  List <ClassQnA> qnalist = clService.selectQnA(classqna);

		  // 후기 리스트 출력
		  List <ClassReview> rvlist = clService.selectReviews(classNo);
		  
		  log.info("rvlist: {}", rvlist);
		  
		  
		  if(cl != null) {	    //키값 : 뷰에서 보여질 변수명, 밸류: 컨트롤러에서 실제 쓰이는 변수명
			  model.addAttribute("coffeeclass", cl);
				/*
				 * String classTimeStr= cl.getClassTime(); 
				 * String[] classTimeArr = classTimeStr.split(",");
				 * >> 객체안에 메소드로 넣어버림
				 */ 
			  model.addAttribute("qnalist", qnalist);
			  model.addAttribute("classTimes", cl.bringTimes());
			  model.addAttribute("rvlist", rvlist);
			  // System.out.println(classqna.getQnaNo());
			  // 연계 카페 이동 : model.addAttribute("Cafe", ca);
			  return "coffeeclass/class_detail";
		  } else {
			  model.addAttribute("errorMsg", "클래스를 불러오는데 실패했습니다.");
			  return "common/error";
		  }		  			
		  
	    }
	  
  	  // 클래스 신고
	  @PostMapping("/coffeeclass/classreport")
	  public String classReport(@ModelAttribute CoffeeClass cl, @ModelAttribute ClassRegister thisclass,
			  					HttpServletRequest request, Model model, RedirectAttributes rttr) {
	
	  Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	  
	  if(loginUser == null) {
		  rttr.addFlashAttribute("msg", "로그인한 회원만 신고할 수 있습니다.");
		  return "redirect:/member/loginView";
	  }
	  
	  if(loginUser.getId() != thisclass.getBuyerId()) {
		  rttr.addFlashAttribute("msg", "수강생만 신고를 할 수 있습니다.");
	  }
	  
	  int result = clService.reportClass(cl);
	 		
	  if(result > 0) {
		 return "redirect:/coffeeclass/classdetail?classNo=" + cl.getClassNo(); 
	  } else {	
		return "common/error";
	  }
			
	  }
	  
	  // 클래스 댓글 신고
	  @PostMapping("/coffeeclass/commentreport")
	  public String commentReport(@ModelAttribute CoffeeClass cl, @ModelAttribute Report r,
			  				  HttpServletRequest request,
							  Model model, String cl_writer) {
	  
	  Member loginUser = (Member)request.getSession().getAttribute("loginUser");

	  int result = clService.reportClComment(cl);
	  
	 		
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

	  // 클래스 문의,질문 등록
	  @PostMapping("/coffeeclass/ask")
	  public String askClass(@ModelAttribute ClassQnA qna, 
			  					  Model model,
			  					HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		  
		  Member loginUser = (Member)session.getAttribute("loginUser");
		  
		  if(loginUser == null) {
			  rttr.addFlashAttribute("msg", "로그인한 회원만 문의를 남길 수 있습니다.");
			  return "redirect:/member/loginView";
		  }
		  
		  String id = loginUser.getId();
		  String classNo = request.getParameter("classNo");
		  
		  // System.out.println(loginUser + id + classNo);
		  
		  qna.setClassNo(classNo);
		  qna.setUserId(id);
		  
		  model.addAttribute("qna", qna);
		  
		  int result = clService.askClass(qna);
		  
		  if(result > 0) {			  
			  return "redirect:/coffeeclass/classdetail?classNo=" + classNo;
		  } else {
			  return "common/error";
		  }
		  
	  }
	  
	  // 클래스 답변 등록
	  @PostMapping("/coffeeclass/answer")
	  public String answerClass(@ModelAttribute ClassQnA qna, Model model, HttpServletRequest request) {
		  
		  String classNo = qna.getClassNo();
		  
		  System.out.println(classNo);
		  
		  int result = clService.answerClass(qna);

		  if(result > 0) {
			  return "redirect:/coffeeclass/classdetail?classNo=" + classNo;
		  } else {
			  return "";
		  }
		  
	  }
	  
	  
		
	  // 클래스 수강신청(바로결제) 페이지 이동
	  @GetMapping("/coffeeclass/register")
	  public String bringClass(Model model, String classNo , 
			  					HttpServletRequest request, String selectedTime) {
		  
		  // 클래스 수정 로직 사용 (불러오는 정보가 같음)
		  CoffeeClass cl = clService.bringClassInfo(classNo); 
		  
		  // view에서 보여질 변수명, 컨트롤러 변수명
		  model.addAttribute("cl", cl);
		  model.addAttribute("selectedTime", selectedTime);
		  // 주소 잘라서 가져오기
		  model.addAttribute("clAddresses", cl.bringAddress());
		  
		  Date clDate = cl.getClassDate();
		  
		  
		  return "coffeeclass/class_register"; 
		 
	  }
	  
	  // 클래스 수강신청(DB INSERT)
	  @PostMapping("/coffeeclass/registser/insert")
	  public String reisterClass(@ModelAttribute Payment clp, Model model,
			  					 String couponPrice, String total,
			  					 HttpServletRequest request, HttpSession session,
			  					 RedirectAttributes rd) {
			
		  Member loginUser = (Member)session.getAttribute("loginUser");
		  System.out.println("클래스 수강신청 : " + clp);
		  
		  int result = clService.registerClOrder(clp.getClPayNo());
		  
		  List<Object> list = new ArrayList<>();
		  
		  list.add(clp);
		  list.add(couponPrice);
		  list.add(total);
		  
		  if(result > 0) {
			  int result1 = clService.registerClass(list);
			  if(result1 > 0) {
				  int result2 = clService.registerClPay();
				  if(result2 > 0) {
					  return"redirect:/nMypage/paymentView";
				  } else {
					  model.addAttribute("msg", "결제에 실패하였습니다.");
					  return "common/error";
				  }
			  } else {
				  model.addAttribute("msg", "결제에 실패하였습니다.");
				  return "common/error";
			  }
		  } else {
			  model.addAttribute("msg", "결제에 실패하였습니다.");
			  return "common/error";
		  }
		  
	  }
}
