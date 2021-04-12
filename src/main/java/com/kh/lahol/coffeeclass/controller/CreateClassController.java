package com.kh.lahol.coffeeclass.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.lahol.coffeeclass.model.exception.CoffeeClassException;
import com.kh.lahol.coffeeclass.model.service.CoffeeClassSerivce;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;

@Controller
public class CreateClassController {
	@Autowired
	private CoffeeClassSerivce clService;
	

	/*
	 * // 클래스 개설 - 파일첨부(리네임)
	 * 
	 * @PostMapping("/insert") public String classInsert(CoffeeClass cl,
	 * 
	 * @RequestParam(value="uploadFile") MultipartFile file, HttpServletRequest
	 * reqeust) {
	 * 
	 * // 업로드 파일 서버에 저장 if(!file.getOriginalFilename().equals("")) { // 파일 저장 메소드
	 * 별도로 작성 - 리네임명 리턴 String renameFileName = saveFile(file, request); // DB에 저장하기
	 * 위한 파일명 세팅 if(renameFileName != null) {
	 * cl.setOriginalFileName(file.getOriginalFilename());
	 * cl.setRenameFileName(renameFileName); } }
	 * 
	 * int result = clService.insertClass(cl);
	 * 
	 * if(result > 0) { return "redirect:/coffeeclass"; } else { throw new
	 * CoffeeClassException("게시글 등록에 실패했습니다."); }
	 * 
	 * }
	 * 
	 * public String saveFile(MultipartFile file, HttpServletRequest request) {
	 * String root =
	 * request.getSession().getServletContext().getRealPath("resources"); // 실제 나의
	 * 경로(워크스페이스 시작)를 불러오는 메소드 String savePath = root + "\\cluploadFiles"; File
	 * folder = new File(savePath); if(!folder.exists()) folder.mkdirs(); // -> 해당
	 * 경로가 존재하지 않는다면 디렉토리 생성
	 * 
	 * // 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자" SimpleDateFormat sdf = new
	 * SimpleDateFormat("yyyyMMddHHmmss"); String originalFileName =
	 * file.getOriginalFilename(); String renameFileName = sdf.format(new Date()) +
	 * "_" + (int)(Math.random() * 100000) +
	 * originalFileName.substring(originalFileName.lastIndexOf("."));
	 * 
	 * String renamePath = folder + "\\" + renameFileName; //저장하고자 하는 경로 + 파일명 try {
	 * file.transferTo(new File(renamePath)); // => 업로드 된 파일 (MultipartFile)이 rename
	 * 명으로 서버에 저장 } catch (IllegalStateException | IOException e) {
	 * System.out.println("파일업로드 에러 : " + e.getMessage()); }
	 * 
	 * return renameFileName;
	 * 
	 * }
	 * 
	 * // 클래스 수정
	 * 
	 * @GetMapping("/coffeeclass/updateclass") public String updateclass(Model
	 * model, String classNo) {
	 * 
	 * CoffeeClass cl = clService.selectCoffeeClass(classNo, false); // CoffeeClass
	 * 객체 리턴, false는 조회수에 대한 내용 model.addAttribute("cl", cl); return
	 * "coffeeclass/bus_classupdate"; }
	 * 
	 * // 클래스 수정 요청
	 * 
	 * @PostMapping("/update") public String classUpdate(CoffeeClass c,
	 * 
	 * @RequestParam(value="updlaodFile") MultipartFile file, HttpServletRequest
	 * request) {
	 * 
	 * // 새로 업로드 된 파일이 있다면=> 기존 파일 삭제 , 업데이트 된 사진 새로 저장
	 * 
	 * 
	 * return ""; }
	 */
	
}
