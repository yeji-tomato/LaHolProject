package com.kh.lahol.store.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.user.model.exception.CafeException;
import com.kh.lahol.cafe.user.model.vo.CoffeeCart;
import com.kh.lahol.common.model.exception.CartException;
import com.kh.lahol.common.model.service.CartService;
import com.kh.lahol.common.model.vo.Cart;
import com.kh.lahol.common.model.vo.Coupon;
import com.kh.lahol.common.model.vo.Report;
import com.kh.lahol.member.model.vo.M_Partner;
import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.normal.model.vo.StoreReview;
//import com.kh.lahol.store.model.service.QService;
import com.kh.lahol.store.model.service.StoreService;
import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Payment;
import com.kh.lahol.store.model.vo.Pr_pay_w;
import com.kh.lahol.store.model.vo.Prpay;
import com.kh.lahol.store.model.vo.Search;
import com.kh.lahol.store.model.vo.Sh_status;
import com.kh.lahol.store.model.vo.Store;
import com.kh.lahol.store.model.vo.StoreReview2;
import com.kh.lahol.store.model.vo.Sub;
import com.kh.lahol.store.model.vo.pr_re;
import com.kh.lahol.store.model.vo.storeA;
import com.kh.lahol.store.model.vo.storeQ;
import com.kh.lahol.store.page.Pagination;
import com.kh.lahol.store.page.Pagination2;
import com.kh.lahol.store.page.Pagination3;/*
											import com.oreilly.servlet.MultipartRequest;
											import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
											import com.oreilly.servlet.multipart.FileRenamePolicy; */
import com.kh.lahol.store.page.Pagination4;

@Controller
@RequestMapping("/store")
@SessionAttributes({"loginUser"})
public class StoreController {
	@Autowired
	private StoreService sService;
	
	@Autowired 
	private CartService cartService;
	
  
	// 상품 리스트 페이지
	@GetMapping("/list")
	public ModelAndView storeList(ModelAndView mv,HttpServletRequest request,
    @RequestParam(value="page" , required=false, defaultValue="1")int currentPage) {
		
		//일반 게시글 카운트 
		int listCount = sService.selectListCount();
		 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		//추천게시글은 3개만 출력
		PageInfo pi2 = Pagination2.getPageInfo(currentPage, listCount);
		List<Store> list = sService.selectList(pi);
		//추천 게시글 용
		List<Store> list2 = sService.selectList2(pi2);
		 
		//int k = 0;
		
		
		
		
		
		
		
		
		if(list !=null) {
			mv.addObject("list", list);
			//mv.addObject("k",k);
			mv.addObject("pi", pi);
			mv.setViewName("store/storemain");
		} else {
		
		}
		
		if(list2 !=null) {
			mv.addObject("list2", list2); 
			//mv.addObject("k",k);
			mv.setViewName("store/storemain");
		} else {
		
		}
		
		
		
		
		 
		
		return mv;
	}
	// 관리자 페이지
	@GetMapping("/list2")
	public ModelAndView storeList2( ModelAndView mv,HttpServletRequest request, HttpSession session ,
    @RequestParam(value="page" , required=false, defaultValue="1")int currentPage) {
		
	
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		 
		
		 //Cafe loginUser2 = (Cafe)session.getAttribute("loginUser");
		String Id = loginUser.getId();
		
		// System.out.println("여이까지는넘어노나?"+loginUser2);		
		
		//내가 작성한 게시글 수만 카운트
		int listCount = sService.mySearchCount(Id);
		 
		PageInfo pi = Pagination4.getPageInfo(currentPage, listCount); 
		List<Store> list = sService.myselectList(pi,Id);
		
		
		 
		 
		if(list !=null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			 
			mv.setViewName("store/B/storemanager");
		} else {
		
		}
		 
		return mv;
	}
	
	 //글쓰기 페이지
	@GetMapping("/create")
	public String writepageView(   HttpSession session ) {
		
		M_Partner loginUser3 = (M_Partner)session.getAttribute("loginUser");
		System.out.println("글쓸대 넘어가나"+loginUser3 );
	 
		return "store/B/storect";
	} 
	
	

	
	@PostMapping("/insert")
	public String StoreInsert(@ModelAttribute Cafe c,@ModelAttribute Store s, 
								@RequestParam MultipartFile mainfile,
								@RequestParam MultipartFile file1,
								@RequestParam MultipartFile file2, 
								HttpServletRequest request, HttpSession session 
			                 ) {
		
		Member loginUser = (Member)session.getAttribute("loginUser"); 
		 //Cafe loginUser2 = (Cafe)session.getAttribute("loginUser");
		 
			  String code = loginUser.getId();
			  
			  s.setC_CODE(code);
			 
		 
		//Cafe c = (Cafe)session.getAttribute("loginUser");
	    //String ccode = c.getCaCode();
	    //String id =((Cafe)request.getSession().getAttribute("loginUser")).getCaCode();
		//c.setCaCode(((Cafe)request.getSession().getAttribute("loginUser")).getCaCode());
		//System.out.println("카페코드를 받아오나?" +c);
		
		if(!mainfile.getOriginalFilename().equals("")) {
			String fileSystemNames = saveFile(mainfile, request);
			
			 
			if(fileSystemNames != null) {
				s.setSTORE_PHOTO1(fileSystemNames);
			}
		}
			
		 if(!file1.getOriginalFilename().equals("")) {
				String fileSystemNames = saveFile(file1, request);				
				
				// DB에 저장하기 위한 파일명 세팅
				if(fileSystemNames != null) {
					s.setSTORE_PHOTO2(fileSystemNames);
				}
			}
		 if(!file2.getOriginalFilename().equals("")) {
				String fileSystemNames = saveFile(file2, request);
				
				// DB에 저장하기 위한 파일명 세팅
				if(fileSystemNames != null) {
					s.setSTORE_PHOTO3(fileSystemNames);
				}
			}
		 
			
		 	
		 
		
		int result = sService.insertStore(s );
		
		if(result > 0) {
			return "redirect:/store/list2";
		}else {
			return "redirect:/store/list2";
		}
		 
		 
	}
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/img/store";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String fileSystemNames = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000) 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "/" + fileSystemNames; // 저장하고자하는 경로 + 파일명
		
		try {
			file.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		} 
		
		return fileSystemNames;
	}
	 
				 
	@GetMapping("/search")
	public ModelAndView storeSearch(ModelAndView mv, @ModelAttribute Search search,HttpServletRequest request,
							   Model model , @RequestParam(value="page" , required=false, defaultValue="1")int currentPage)  {
		
		 
		String condition = request.getParameter("searchCondition");
		String value = request.getParameter("searchValue");
		
		
		 Search sc = new Search();
		
		 sc.setSearchCondition(condition);
		 sc.setSearchValue(value);
	 
		 
	 
		
		 int listCount = sService.selectSearchCount(sc); 
		//int listCount = sService.selectListCount();
		 PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		 PageInfo pi2 = Pagination2.getPageInfo(currentPage, listCount);
		 
		 
		 
		List<Store> searchList = sService.searchList(sc,pi); 
		List<Store> list2 = sService.selectList2(pi2);
		
		
		
	
		if(searchList !=null) {
			mv.addObject("list", searchList);
			mv.addObject("pi", pi);
			mv.setViewName("store/storemain");
		} else {
		
		}
		if(searchList !=null) {
			mv.addObject("list2", list2); 
			mv.setViewName("store/storemain");
		} else {
		
		}
		  
		return mv;
	}
	
	@GetMapping("/storedetail")
	public String storeDetail(int PR_CODE, String QnA_NO,  HttpServletRequest request,ModelAndView mv, @ModelAttribute Cafe q,String qqw,int k ,
			  HttpServletResponse response, @RequestParam(value="page" , required=false, defaultValue="1")int currentPage ,
			  Model model) {
		boolean flagslist = false; 
		boolean flagPR = false; 
		
		Cookie[] cookies = request.getCookies();
		try {
			if (cookies != null) {
				for (Cookie c : cookies) {
				 
					if (c.getName().equals("slist")) {
						flagslist = true;
						 
						String slist = URLDecoder.decode(c.getValue(), "UTF-8");
						 
						String[] list = slist.split(",");
						for(String st : list) {
						 
							if(st.equals(String.valueOf(PR_CODE))) flagPR = true;
						}
						if(!flagPR) {	// 게시글을 읽지 않았다면
							c.setValue(URLEncoder.encode(slist + "," + PR_CODE, "UTF-8"));
							response.addCookie(c); // 응답에 담아 보냄
						}
					}
				}
				if(!flagslist) {
					 
					Cookie c1 = new Cookie("slist", URLEncoder.encode(String.valueOf(PR_CODE), "UTF-8"));
					response.addCookie(c1);
							}
						}
			
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					
				System.out.println("k의 값은??"+k);
		//제품 Q 리스트 
		
				String condition = request.getParameter("searchCondition");
				String value = request.getParameter("PR_CODE");
				
				
				 Search sc = new Search();
				
				 sc.setSearchCondition(condition);
				 sc.setSearchValue(value);
				 
				 System.err.println("질분 제품번호  " + PR_CODE);
				 System.err.println("q리스트 " + sc);
			 
				
				 int listCount = sService.selectQCount(sc);  
				 PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		 
				 System.out.println("질문객수 카운트"+listCount);
			 
			
			
			 List<storeQ> QsearchList = sService.QsearchList(sc,pi); 
		
			
			//리뷰ㅜ리스트!!!!!!
			 int listCount2 = sService.selectReviewCount(sc); 
			 PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount2);
			 List<StoreReview2> ReviewList = sService.ReviewList(sc,pi2); 
			 
			 
			
			 System.out.println("리뷰"+ReviewList);
			 System.out.println(ReviewList.size());
			 
			 
			 
			 
			/*
			 * int listCount2 = sService.selectACount(sc); PageInfo pi2 =
			 * Pagination.getPageInfo(currentPage, listCount2);
			 */
			 List<storeA> Alist = sService.AsearchList(sc,pi); 
			 
			 
			
			
			 System.out.println("답변 리스트 나오나?"+ Alist);
	 
			 System.out.println("답변갯수"+ Alist.size()); // 답변 갯수가 넘어오는지확인 
			 
			 
				
				if(Alist.size() < 1 ) {
					
					 String Alist2 = "x";   
					
					System.out.println(Alist2);  // 답변갯수가 0이면 x값 넣어줌
					model.addAttribute("Alist2", Alist2); 
					
				}
				
				
				if(k == 0 ) { 
					 String talbe = "tab-pane fade show active";
					 String table2 = "tab-pane fade";
					 String talbe3= "tab-pane fade";
					 String sa = "nav-link active";
					 String sa1  ="nav-link"; 
					 String sa2  ="nav-link"; 
					 model.addAttribute("table",talbe); 
					 model.addAttribute("table2",table2); 
					 model.addAttribute("table3",talbe3); 
					 model.addAttribute("sa",sa); 
					 model.addAttribute("sa1",sa1); 
					 model.addAttribute("sa2",sa2); 
					} else if(k ==1 ) { 
						 String table = "tab-pane fade";
						 String talbe2= "tab-pane fade show active";
						 String talbe3= "tab-pane fade";
						 String sa  ="nav-link"; 
						 String sa1 = "nav-link active";
						 String sa2  ="nav-link"; 
						 model.addAttribute("table",table); 
						 model.addAttribute("table2",talbe2);  
						 model.addAttribute("table3",talbe3); 
						 model.addAttribute("sa",sa); 
						 model.addAttribute("sa1",sa1); 
						 model.addAttribute("sa2",sa2); 
				}else if(k ==2) {
					 String table = "tab-pane fade";
					 String talbe2= "tab-pane fade";
					 String talbe3= "tab-pane fade show active";
					 String sa  = "nav-link"; 
					 String sa1  = "nav-link";
					 String sa2  ="nav-link active"; 
					 model.addAttribute("table",table); 
					 model.addAttribute("table2",talbe2);  
					 model.addAttribute("table3",talbe3); 
					 model.addAttribute("sa",sa); 
					 model.addAttribute("sa1",sa1); 
					 model.addAttribute("sa2",sa2); 
					
					
					
					
				}
				
			// 제품 정보 
			 
		
			Store s = sService.selectStore(PR_CODE, !flagPR);
			
			
			//카페코드 갖고오기 
			String a = s.getC_CODE();
			System.out.println("카페코드" + a);
			
			 Search cd = new Search();
		
			 cd.setSearchValue(a);
			
			 List<Cafe> CafeCode = sService.CafeCode(cd); 
			
		 
			System.out.println("아이디"+CafeCode);
			
			
		 	
		
			if(s != null   ) {
				model.addAttribute("s", s); 
				model.addAttribute("a", a); 
				model.addAttribute("QsearchList", QsearchList); 
				model.addAttribute("Alist", Alist); 
				model.addAttribute("CafeCode", CafeCode); 
				model.addAttribute("ReviewList",ReviewList); 
				model.addAttribute("pi", pi);
				model.addAttribute("pi2", pi2);
				
				return "store/storedetail";
				
			} else {
				return "store/storedetail";
			}
			
	 
		  
		
		
	}
	//질문등록
	@PostMapping("/question")
	public String questionView(@ModelAttribute storeQ q ,Model model,HttpServletRequest request,   int PR_CODE, HttpSession session   ) {
		
		 
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		String id =loginUser.getId();
		
		 System.out.println("제품 번호넘어와라"+PR_CODE); 
		 String qn = request.getParameter("PR_CODE");
		 
		 q.setPR_CODE(qn);
		 q.setId(id);
		 
		 System.out.println("제품번호 질문자 아이디 넘어오나?" + qn+ id);
		 
		 int result = sService.insertQuestion(q);
		 
		

		 String ss="tab-pane fade show active";
		 
		 
		 
		 
		 if(result > 0) {
				 
			 return "redirect:/store/storedetail?&k=1&PR_CODE="+PR_CODE+"#qa" ;
			} else {
			  return "redirect:/store/storedetail?&k=1&PR_CODE="+PR_CODE ; // 나중에 에러 페이지연결
			}
		  
	}
	
	 
	//질문 답변  
	@PostMapping("/anser")
	public String anserView(@ModelAttribute storeA s, Model model,HttpServletRequest request, int qnaNo , int PR_CODE, HttpSession session) {
		
	 
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		String id =loginUser.getId();
		
		 
		 String q = request.getParameter("qnaNo");
		 
		 s.setQnaNo(q);
		 
		 s.setId(id);
		 
		 
		 
		 int result = sService.insertAnser(s);
		 
		 
			/*
			 * String condition = request.getParameter("searchCondition"); String value =
			 * request.getParameter("qnaNo");
			 * 
			 * 
			 * Search sc = new Search();
			 * 
			 * sc.setSearchCondition(condition); sc.setSearchValue(value);
			 * 
			 * 
			 * int listCount = sService.selectSearchCount(sc);
			 */
		 
		 
		// List<storeA> Alist = sService.AsearchList(sc); 
		 
		 
		// System.out.println("답변 내용 " + Alist);
		 
		 
		 
		 if(result > 0) {
				   
			// redirect.addFlashAttribute("Alist", Alist);
			 return "redirect:/store/storedetail?&k=1&PR_CODE="+PR_CODE+"#qa" ;
			} else {
			  return "redirect:/store/storedetail?&k=1&PR_CODE="+PR_CODE ; // 나중에 에러 페이지연결
			}
		 
		 
		  
	}
	

	
	
	
	
	@GetMapping("updatepage")
	public String updatepageView(Model model, int PR_CODE) {
		Store s  = sService.selectStore(PR_CODE, false); 
		model.addAttribute("s", s);
		return "store/B/storeupdate";
	}
	
	
	// 게시글 수정
		@PostMapping("/update")
		public String storeUpdate(Store s,  
								 	@RequestParam MultipartFile mainfile,
									@RequestParam MultipartFile file1,
									@RequestParam MultipartFile file2,    HttpServletRequest request, ServletRequest multiRequest) throws IOException {
			
		  
			
			String main = multiRequest.getParameter("mainfile"); // 이미지 변경 안하려면 기존 이미지 히든값으로  불러옴
			String fi1  = multiRequest.getParameter("file1"); 
			String fi2 = multiRequest.getParameter("file2"); 
			System.out.println("기존 이미지 "+main); //기존이미지 잘 나오나?
			
			if(main != null) {  
				String fileSystemNames = main;
				
				 
				if(fileSystemNames != null) {
					s.setSTORE_PHOTO1(fileSystemNames); 
				};
			}
			
			
		 	if(!mainfile.getOriginalFilename().equals("")) {
				String fileSystemNames = saveFile(mainfile, request);
				
				 
				if(fileSystemNames != null) {
					s.setSTORE_PHOTO1(fileSystemNames); 
				}
			} 
		 	
		 	
		 	
			if(fi1 != null) {  
				String fileSystemNames = fi1;
				
				 
				if(fileSystemNames != null) {
					s.setSTORE_PHOTO2(fileSystemNames); 
				};
			}
			
		 	
		 
		   if(!file1.getOriginalFilename().equals("")) {
			   String fileSystemNames = saveFile(file1, request);
		  
			   if(fileSystemNames != null) {
			   s.setSTORE_PHOTO2(fileSystemNames);
			   }
			 }
		  
		   
			if(fi2 != null) {  
				String fileSystemNames = fi2;
				
				 
				if(fileSystemNames != null) {
					s.setSTORE_PHOTO3(fileSystemNames); 
				};
			}
		   
		  if(!file2.getOriginalFilename().equals("")) {
			  String fileSystemNames =  saveFile(file2, request);
		  
		  if(fileSystemNames != null) {
		  s.setSTORE_PHOTO3(fileSystemNames);
		  	} 
		  }
		 
			
			int result = sService.updateStore(s);
 
			 
			if (result > 0) {            
				return  "redirect:/store/storedetail?&k=0&PR_CODE=" +s.getPR_CODE();
			} else {
				 
			} 
			
			 
			return  "redirect:/store/storedetail?&k=0&PR_CODE="+s.getPR_CODE();
		}
	
	@GetMapping("/delete")
	public String StoreDelete(int PR_CODE, HttpServletRequest request) {
		 
		Store s = sService.selectStore(PR_CODE, false);
		
	 
		 
		int result = sService.deleteStore(PR_CODE);
		
	 
		if(result > 0) {
			return "redirect:/store/list2?k=0";
		}else {
			return "redirect:/store/list2?k=0";
		}
	 
	}
	
	@GetMapping("/subW")
	public String subscribewritepage(Model model, int PR_CODE  ) {
		
		
		
		System.out.println("정기구독 제품 정보 "+ PR_CODE);
		
		boolean flagPR = false; 
		
		Store s = sService.selectStore(PR_CODE, !flagPR);
		
		
		if(s != null   ) {
			model.addAttribute("s", s);  
		  
			return "store/U/subscribe";
		} else {
			return "store/U/subscribe";
		}
		
	
	} 
	
	
	
	@PostMapping("/subscribe")
	public String subscribe(@ModelAttribute Sub sb,@ModelAttribute Payment py,@ModelAttribute Sh_status st  ,@ModelAttribute Prpay pa  ,Model model, String PR_CODE, ModelAndView mv,
			  int PR_PRICE,String PR_NAME, @RequestParam("SUBSCRIPTIONS") String SUBSCRIPTIONS, HttpSession session   ) {
		
		
	
		 
		 
		
		int pr =  Integer.parseInt(SUBSCRIPTIONS);
		
		 
		
		//System.out.println("구독일수"+SUBSCRIPTIONS);
		sb.setSubs_Month(SUBSCRIPTIONS);
		
		
		
		if(pr ==3) {
			double a = ((PR_PRICE*3)- ((PR_PRICE*3)* 0.05))/3;
			String b = Double.toString(a);
			
			// System.out.println("총 가격"+b);
			sb.setPay(b);
			py.setPayPrice(b);
			py.setPay_total(b);
			
		}else if(pr == 6) {
			double a = ((PR_PRICE*6)- ((PR_PRICE*6)* 0.1))/6;
			String b = Double.toString(a);
			
			 
			sb.setPay(b);
			py.setPayPrice(b);
			py.setPay_total(b);

		}else if(pr == 9) {
			
			double a = ((PR_PRICE*9)- ((PR_PRICE*9)* 0.15))/9;
			String b = Double.toString(a);
			
			System.out.println("9개월 선택");
			 
			sb.setPay(b);
			py.setPayPrice(b);
			py.setPay_total(b);
		}
		
		
		
		
		 
		 sb.setPr_code(PR_CODE);
		
		 
		 
		 Member loginUser = (Member)session.getAttribute("loginUser"); 
		 String id =loginUser.getId();
		 
		 int result = sService.subscribe(sb);
		
		 String dd = "Y"; //구독
		 System.out.println(PR_NAME);
		 
		 py.setPayItem(PR_NAME);
		 py.setSubscribe(dd);
		 py.setId(id);
		 py.setSubscribe_code(PR_CODE); 
		 
		
		 
		  


		// System.out.println("제품정보"+sb);
		 
		 String a = sb.getSub_code();
		 
	 
		 int result2 = sService.PAYMENT(py); 	
		 
		 int result3 = sService.prpay(pa); 	
		 
		 int result4 = sService.sh(st); 	 
	
		 if(result > 0) {
			 return "redirect:/store/list?k=0";
			 
		 }else 
		 {  return "redirect:/store/list?k=0";
		 } 
		 
		  
		
	
	} 
	
	/*
	 * @PostMapping("/storcart") public String asd(@ModelAttribute Cart,String p_num1 ) {
	 * 
	 * System.out.println("수량정보"+p_num1);
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * return null;
	 * 
	 * 
	 * }
	 * 
	 */
	
	
	 @GetMapping("/order")
	public String storeOrder(Model model, int PR_CODE,int su, int pr ) {
		// System.out.println(p_num1);
		Store s  = sService.selectStore(PR_CODE, false); 
		model.addAttribute("s", s); 
		model.addAttribute("su", su); 
		model.addAttribute("pr", pr); 
		return "store/U/storeOder";
	}
	
	
	
		@PostMapping("/storecart")
		public String storeCartInsert(@ModelAttribute Pr_pay_w py,String price,
				String p_num  ,String pr_code , HttpSession session) throws CartException {
			
			
		

			Member loginUser = (Member)session.getAttribute("loginUser"); 
			String id = loginUser.getId();
			
			int pr =  Integer.parseInt(price);
			int su = Integer.parseInt(p_num);
		 
			 
			System.out.println("제품가격"+pr);
			 
			System.out.println("제품 갯수"+ su);
			py.setPr_code(pr_code);
			py.setPr_count(su);
			
			//int result = sService.storepayInsert(py);
			 
		 
		 
			
		 
			
			
		
			 return "redirect:/store/order?PR_CODE="+pr_code+"&su="+su+"&pr="+pr;
			 
		
		
			
		}
		
		@PostMapping("/storecart2")
		public String storeCartInsert(@ModelAttribute Pr_pay_w py,@ModelAttribute Sh_status st,@ModelAttribute Payment pay ,@ModelAttribute Prpay pa  ,  
				 String su  ,String pr_code,  HttpSession session,HttpServletRequest request) throws CartException {
			
			
		

			Member loginUser = (Member)session.getAttribute("loginUser");
			 
			String id = loginUser.getId();
			
			 
			System.out.println("결제됬나?");
			
			System.out.println("갯수는"+su);
			System.out.println("상품코드는?" + pr_code);
			int num = Integer.parseInt(su);
			 
			 
	 
			py.setPr_code(pr_code);
			py.setPr_count(num);
			//주문상세
			int result = sService.storepayInsert(py);
			
			
		 
		 
			 
			 
			 
				 
				 String dd = "N"; //구독여부 
			 
				 pay.setSubscribe(dd);
				 pay.setId(id);
				 pay.setSubscribe_code(pr_code); 
		
				 
				 int result2 = sService.paymnet(pay); 	
				 
			 
			 //결세상세
			 int result3 = sService.prpay2(pa); 	
			 
			 
			 //배송현황
			 int result4 = sService.sh(st); 	 
		 
			 
			
			
			 if(result  > 0) {
				 return "redirect:/store/storedetail?&k=0&PR_CODE="+pr_code;
			 
			 }else { throw new
				 CartException(" "); }
		
			
		}
		
		
		
		// 제품 신고 
		@PostMapping("/report")
		public String PrReport(@ModelAttribute Report rep , @ModelAttribute pr_re rp , int PR_CODE,String c_code,  HttpSession session,HttpServletRequest request) throws CafeException{
			
	 
			
			System.out.println("카페코드"+c_code);
			Member loginUser = (Member)session.getAttribute("loginUser"); 
			String id = loginUser.getId();
			String code = request.getParameter("PR_CODE");
			
			
			
			/*
			 * rp.setPr_code(code); int result2 = sService.prReportin(rp);
			 */
			
			
			
			rep.setItemCode(code);
			rep.setReporterId(id);
			rep.setReporteeId(c_code);
			int result = sService.prReport(rep);
			
			
			if(result > 0) {
				return "redirect:/store/storedetail?&k=0&PR_CODE="+PR_CODE;
			}else {
				throw new CafeException("제품 신고에 실패하였습니다.");
			}	
		}
		
		// 제품 리뷰신고 
				@PostMapping("/report2")
				public String PrRReport(@ModelAttribute Report rep  , int PR_CODE, String r_no,  HttpSession session,HttpServletRequest request) throws CafeException{
					
			 
					
					System.out.println("리뷰번호"+r_no);
					Member loginUser = (Member)session.getAttribute("loginUser"); 
					String id = loginUser.getId();
				 
					 
					
					rep.setItemCode(r_no);
					rep.setReporterId(id);
					rep.setReporteeId(r_no);
					int result = sService.PrRReport(rep);
					
					
					if(result > 0) {
						return "redirect:/store/storedetail?&k=0&PR_CODE="+PR_CODE;
					}else {
						throw new CafeException("리뷰 신고에 실패하였습니다.");
					}	
				}
		
	 
}
