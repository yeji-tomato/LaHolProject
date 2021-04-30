package com.kh.lahol.cafe.user.model.vo;

import java.sql.Date;

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
public class CaReview {
	private String crevNo;
	@DateTimeFormat(pattern="YY/MM/DD")
	private Date crevDate;
	private double crevGra;
	private String crevCon;
	private String crevIname;
	private String crevIchName;
	private String crevIpath;
	private String crevSta;
	private String caCode;
	private String id;
	private String caRes;
}
