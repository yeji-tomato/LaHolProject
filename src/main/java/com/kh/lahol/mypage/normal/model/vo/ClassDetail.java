package com.kh.lahol.mypage.normal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ClassDetail {
	private String pay_no;
	private String c_code;
	private String class_no;
	private String cl_name;
	private Date pay_date;
	private String tr_name;
	private int cl_max;
	private Date cl_date;
	private String cl_time;
	private String c_name;
	private String c_address;
	private String c_la;
	private String c_lo;
}
