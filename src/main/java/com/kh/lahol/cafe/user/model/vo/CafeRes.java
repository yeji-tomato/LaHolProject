package com.kh.lahol.cafe.user.model.vo;

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
public class CafeRes {
	private String caResNo;
	private String caResType;
	@DateTimeFormat(pattern="YY/MM/DD")
	private Date caResDate;
	private int caResPer;
	private String caNo;
	private String userId;
	private String caResIng;
	private String caResHereTime;
	private String caResGoTime;
	private Date caToDate;
}
