package com.kh.lahol.mypage.partner.model.vo;

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
public class Shipping {
	private String shipping_code;
	private String pay_no;
	private String pay_item;
	private String shipping_status;
	private Date shipping_date;
	private String delivery;
	private String subs_month;
	private String sub;
	private int count;
	private String buyer_id;
	private String addr;
	private String id;
}
