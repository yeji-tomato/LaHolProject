package com.kh.lahol.cafe.bus.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class OrderList {
	private String caResNo;
	private String caResType;
	@DateTimeFormat(pattern="YY/MM/DD")
	private Date caResDate;
	private String caCode;
	private String userId;
	private String caResing;
	private String caHereTime;
	private String caGoTime;
	private String cfName;
	private String name;
	private String phone;
}
