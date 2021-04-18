package com.kh.lahol.coffeeclass.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ClassRegister {

	private String buyerId;
	private String classNo;
	private String className;
	private int classPrice;
	private Date buyDate;
	
	
}
