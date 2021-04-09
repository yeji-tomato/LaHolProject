package com.kh.lahol.coffeeclass.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;

@Controller
public class CreateClassController {
	
	@GetMapping("/coffeeclass/createclass")
	public String createclass() {
		return "coffeeclass/bus_create";
	}
	
	// 클래스 개설 - 파일첨부(리네임)
	@PostMapping("/insert")
	public String classInsert(CoffeeClass cl, 
							  @RequestParam(value="uploadFile") MultipartFile file,
							  HttpServletRequest reqeust) {
		
		// 첨부파일 저장
		String renameFileName = saveFile(file, reqeust);
		
		return "";
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\cluploadFiles";
		File folder = new File(savePath); 
		if(!folder.exists()) folder.mkdirs();
		
		return "";
		
	}
	
}
