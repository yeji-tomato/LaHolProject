package com.kh.lahol.cafe.bus.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lahol.cafe.bus.model.service.CafeBizService;
import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.user.model.exception.CafeException;
import com.kh.lahol.cafe.user.model.service.CafeService;
import com.kh.lahol.cafe.user.model.vo.CafeRes;

@Controller
@RequestMapping("/cafe/biz")
public class CafeBizController {
	
	@Autowired private CafeBizService caBizService;
	
	private static final Logger logger = LoggerFactory.getLogger(CafeBizController.class);
	
	@GetMapping("/write")
	public String caWriteSelect(@RequestParam String caId,
							Model model) {
		Cafe ca = caBizService.caWriteSelect(caId);
		
		if(ca != null) {
			model.addAttribute("Cafe", ca);
			return "cafe/bus/write";
		}else {
			model.addAttribute("msg", "카페 보기에 실패하였습니다.");
			return "common/error";
		}
		
	}
	
	
	@PostMapping("/insert")
	public String insertCafeInfo(@ModelAttribute Cafe c,
								@RequestParam(name="imgfile1") MultipartFile mainfile,
								@RequestParam(name="imgfile2") MultipartFile file1,
								@RequestParam(name="imgfile3") MultipartFile file2,
								@RequestParam(name="imgfile4") MultipartFile file3,
								@RequestParam(name="cafeAddress1") String cafeAddress1,
								@RequestParam(name="cafeAddress2") String cafeAddress2,
								HttpServletRequest request) throws CafeException {
		
		c.setCaAddress("우편번호"+ "," + cafeAddress1 + "," + cafeAddress2);
		
		 
		 if(!mainfile.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				String renameFileName = saveFile(mainfile, request);
				
				// DB에 저장하기 위한 파일명 세팅
				if(renameFileName != null) {
					c.setMainPhoto(renameFileName);
				}

			}
		 if(!file1.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(file1, request);				
				
				// DB에 저장하기 위한 파일명 세팅
				if(renameFileName != null) {
					c.setPhoto1(renameFileName);
				}
			}
		 if(!file2.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(file2, request);
				
				// DB에 저장하기 위한 파일명 세팅
				if(renameFileName != null) {
					c.setPhoto2(renameFileName);
				}
			}
		 if(!file3.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(file3, request);
				
				// DB에 저장하기 위한 파일명 세팅
				if(renameFileName != null) {
					c.setPhoto3(renameFileName);
				}
			}
		 	
		
		System.out.println("카페 : "+ c);
		
		int result = caBizService.insertCafeInfo(c);
		
		if(result > 0) {
			return "cafe/bus/confirm";
		}else {
			throw new CafeException("카페 정보 등록에 실패하였습니다.");
		}
		
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
	      String root = request.getSession().getServletContext().getRealPath("resources");
	      String savePath = root + "\\nuploadFiles\\cafeImg";
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
	         // => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
	      } catch (IllegalStateException | IOException e) {
	         System.out.println("파일 업로드 에러 : " + e.getMessage());
	      }
	      
	      return renameFileName;
	   }
	
	
	@GetMapping("/confirm")
	public ModelAndView cafeList(ModelAndView mv) {
		List<Cafe> Cafelist = caBizService.selectCafeList();
		
		if(Cafelist != null) {
			mv.addObject("Cafelist", Cafelist);
			mv.setViewName("cafe/bus/confirm");
		}else {
			mv.addObject("msg", "해당하는 카페 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	@GetMapping("/caDetail")
	public String caDetail(@RequestParam String caCode,
							Model model) {
		Cafe ca = caBizService.selectCafeInfo(caCode);
		
		if(ca != null) {
			model.addAttribute("Cafe", ca);
			return "cafe/bus/upCafe";
		}else {
			model.addAttribute("msg", "등록된 카페 보기에 실패하였습니다.");
			return "common/error";
		}
		
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
	      String root = request.getSession().getServletContext().getRealPath("resources");
	      String savePath = root + "\\buploadFiles\\cafeImg";
	      
	      File deleteFile = new File(savePath + "\\" + fileName);
	      
	      if(deleteFile.exists())
	         deleteFile.delete();
	   }
	
	
	@PostMapping("/update")
	public String updateCafeInfo(@ModelAttribute Cafe c,
								@RequestParam(name="imgfile1") MultipartFile mainfile,
								@RequestParam(name="imgfile2") MultipartFile file1,
								@RequestParam(name="imgfile3") MultipartFile file2,
								@RequestParam(name="imgfile4") MultipartFile file3,
								@RequestParam(name="cafeAddress1") String cafeAddress1,
								@RequestParam(name="cafeAddress2") String cafeAddress2,
								HttpServletRequest request) throws CafeException {
		c.setCaAddress(cafeAddress1 + "," + cafeAddress2);
		 
		 if(!mainfile.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			if(c.getMainPhoto() != null) {
				deleteFile(c.getMainPhoto(), request);
			}
			
			String renameFileName = saveFile(mainfile, request);
			
			if(renameFileName != null) {
				c.setMainPhoto(renameFileName);
			}	
		 }
		 
		 if(!file1.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			if(c.getPhoto1() != null) {
				deleteFile(c.getPhoto1(), request);
			}
			
			String renameFileName = saveFile(file1, request);
			
			if(renameFileName != null) {
				c.setPhoto1(renameFileName);
			}	
		 }
		 
		 if(!file2.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			if(c.getPhoto2() != null) {
				deleteFile(c.getPhoto2(), request);
			}
			
			String renameFileName = saveFile(file2, request);
			
			if(renameFileName != null) {
				c.setPhoto2(renameFileName);
			}	
		 }
		 
		 if(!file3.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			if(c.getPhoto3() != null) {
				deleteFile(c.getPhoto3(), request);
			}
			
			String renameFileName = saveFile(file3, request);
			
			if(renameFileName != null) {
				c.setPhoto3(renameFileName);
			}	
		 }
		 	
		
		System.out.println("카페 : "+ c);
		
		int result = caBizService.updateCafeInfo(c);
		
		if(result > 0) {
			return "redirect:/cafe/biz/confirm";
		}else {
			throw new CafeException("카페 정보 수정에 실패하였습니다.");
		}
	}
	
	@GetMapping("/Coffee")
	public ModelAndView coffeeSelect(ModelAndView mv, @RequestParam String caCode) {
		
		System.out.println(caCode + "caCode");
		
		List<Coffee> Coffeelist = caBizService.selectCoffeeList(caCode);
		
		
		mv.addObject("Coffeelist", Coffeelist);
		mv.setViewName("cafe/bus/coffee");
		
		return mv;
		
	}
	
	@PostMapping("/coffee/insert")
	public String insertCoffee(@ModelAttribute Coffee co,
								@RequestParam(name="imgfile1") MultipartFile mainfile,
								HttpServletRequest request) throws CafeException {
		
		 
		 if(!mainfile.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				String renameFileName = saveFile(mainfile, request);
				
				// DB에 저장하기 위한 파일명 세팅
				if(renameFileName != null) {
					/* co.setMainPhoto(renameFileName); */
				}

			}
		 
		 	
		
		System.out.println("카페사진 : "+ co);
		
		return null;
		
		/*
		 * int result = caBizService.insertCafeInfo(c);
		 * 
		 * if(result > 0) { return "cafe/bus/confirm"; }else { throw new
		 * CafeException("카페 정보 등록에 실패하였습니다."); }
		 */
		
		
	}

}
