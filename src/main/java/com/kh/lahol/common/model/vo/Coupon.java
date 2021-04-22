package com.kh.lahol.common.model.vo;

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
public class Coupon {
	private String couponCode;
	private String id;
	private String couponName;
	private int limit;
	private String issuedBy;
	private String issuedDate;
	private Date expDate;
	private String isUsed;

}
