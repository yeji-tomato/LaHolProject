package com.kh.lahol.cafe.user.model.vo;

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
public class CoffeeCart {
	private String cfResNo;
	private String cfResHI;
	private String cfResCap;
	private String cfResCup;
	private String caResNo;
	private int cfResAmount;
	private String cfNo;
	private String cfIchname;
	private String cfName;
	private int cfPrice;
	private int cfCount;
	private Date caResDate;
	private String caResType;
	private String caResHereTime;
	private String caResGoTime;
	private String id;
}
