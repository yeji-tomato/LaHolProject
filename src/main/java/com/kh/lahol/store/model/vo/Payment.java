package com.kh.lahol.store.model.vo;

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
public class Payment {
	private String pay_no;
	private String PAY_ITEM;
	private String pay_price;
	private String subscribe;
	private Date pay_date;
	private String id;
	private String cafe_res;
	private String ad_code;
	private String purchase_number;
	private String subscribe_code;
	private String cl_pay_no;
	private String pay_dc;
	private String pay_total;
	private String cl_tile;
}
