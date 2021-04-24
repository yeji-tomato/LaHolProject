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
public class PayList {
	private String pay_no;
	private String pay_item;
	private String buyer_id;
	private String cafe_res;
	private String purchase_number;
	private String subscribe_code;
	private String class_no;
	private String cl_pay_no;
	private Date pay_date;
	private String pay_price;
	private String pay_dc;
	private String pay_total;
	private String id;
	private int pr_count;
	private String shipping_status;
	private Date shipping_date;
	private String cl_status;
	private String c_res_ing;
	private String cl_name;
	private String cl_time;
	private Date cl_date;
	private String c_la;
	private String c_lo;
	private String c_address;
}
