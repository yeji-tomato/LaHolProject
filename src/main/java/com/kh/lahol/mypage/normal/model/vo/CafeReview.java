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
public class CafeReview {
	private String c_rev_no;
	private Date c_rev_date;
	private double c_rev_gra;
	private String c_rev_con;
	private String c_rev_iname;
	private String c_rev_ichname;
	private String c_rev_ipath;
	private String c_rev_sta;
	private String c_code;
	private String id;
	private String c_res;
}
