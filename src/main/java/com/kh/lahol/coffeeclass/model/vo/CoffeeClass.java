package com.kh.lahol.coffeeclass.model.vo;
  
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// Lombok추가를 통해 Constructor/gettersetter/toString을 생략할 수 있다
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CoffeeClass{
	
	// coffeeclass정보
	private String classNo;
	private String busNo;
	private String cafeNo;
	private String className;
	private String clShortDes;
	private String classDes;
	private String trName;
	private String trIntro;
	private String classCurri;
	private int studentMax;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date classDate;
	private String classLoca;
	private int clPrice;
	private String classLvl;
	private int runtime;
	private String blind;
	private String status;
	private String classTime;
	private String classTime2;
	private String classTime3;
	private String clRuntime;
	private String clThumbnail;
	private String trPhoto;
	private String clPhoto;
	private String clWriter;
	private String category;
	private int avggrade;
	
	// report정보
	private String rpReason;
	private String rpDeets;
	private String reportee;
	private String reporter;
	
	

	public String[] bringTimes() {
		return classTime.split(","); // "10:00-11:00,11:00-12:00,13:00-14:00" >> [A, B, C]
	}
	
	public String[] bringAddress() {
		return classLoca.split(","); // "강남구 서초동, 현대아파트 112동 901호" >> [강남구 서초동, 현대]
	}
}
