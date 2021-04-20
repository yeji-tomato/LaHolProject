package com.kh.lahol.store.model.vo;

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
public class Sub {
	private String Sub_code;
	private String Pr_code;
	private String Subs_Month;
	private String Pay;
	private String Number;
	private String S_status;
	private Date S_date;
	
}
