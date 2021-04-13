package com.kh.lahol.coffeeclass.model.vo;
  
import java.sql.Date;

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
	private Date classDate;
	private String classLoca;
	private String clPrice;
	private String classLvl;
	private int runtime;
	private String blind;
	private String status;
	private String classTime;
	private String clRuntime;
	private String clThumbnail;
	private String trPhoto;
	private String clPhoto;
	

	public String[] bringTimes() {
		return classTime.split(","); // "10:00-11:00,11:00-12:00,13:00-14:00" >> // [A, B, C]
	}
}
