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
public class StoreDetail {
	private String pay_no;
	private String pay_item;
	private String purchase_number;
	private String subscribe_code;
	private Date pay_date;
	private int pr_count;
	private String pay_total;
	private String addr;
	private String delivery;
	private String subs_month;
	private String sub;
	private Date shipping_date;
	private String shipping_status;
}
