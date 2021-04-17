package com.kh.lahol.member.model.vo;

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
public class Coupon{
	private String coupon_code;
	private String id;
	private String coupon_name;
	private int limit;
	private String issuedBy;
	private String issuedDate;
	private Date expDate;
	private String isUsed;
	
	private int issued;
	private int expired;
	private int used;
}
