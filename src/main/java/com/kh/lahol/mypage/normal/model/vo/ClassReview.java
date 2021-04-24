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
public class ClassReview {
	private String cl_review_no;
	private String cl_pay_no;
	private String class_no;
	private String writer_id;
	private double cl_grade;
	private String cl_rev_img;
	private String cl_review;
	private String blind;
	private Date cl_rev_date;
	private String cl_rev_rename;
	private String cl_rev_path;
}
