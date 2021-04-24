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
public class CafeDetail {
	private String pay_no;
	private String c_res;
	private String cf_no;
	private String c_code;
	private Date pay_date;
	private String pay_total;
	private String c_res_type;
	private Date c_res_date;
	private String c_heretime;
	private String c_gotime;
	private int c_res_per;
	private String c_res_ing;
	private String c_name;
	private String c_address;
	private String c_la;
	private String c_lo;
	private String buyer_id;
	private String cf_res_hi;
	private String cf_res_cap;
	private String cf_res_cup;
	private int cf_amount;
	private String cf_category;
	private String cf_name;
	
}
