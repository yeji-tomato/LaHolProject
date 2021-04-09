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
	private String cafeNo;
	private String className;
	private String classDes;
	private String trName;
	private String trIntro;
	private String classCurri;
	private int studentMax;
	private Date classDate;
	private String classLoca;
	private String clPrice;
	private String blind;
	private String status;
	
	

}
