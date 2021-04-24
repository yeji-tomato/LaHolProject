package com.kh.lahol.common.model.vo;

import java.util.Date;

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
	private String payNo;
	private String payItem;
	private String payPrice;
	private String subscribe;
	private Date payDate;
	private String buyId;
	private String cafeRes;
	private String adCode;
	private String purchaseNumber;
	private String subscribeCode;
	private String clPayNo;
	private String payDC;
	private String payTotal;
	private String clTime;

}
