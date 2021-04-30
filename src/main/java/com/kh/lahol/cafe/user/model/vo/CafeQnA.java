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
public class CafeQnA{
	private String qaNo;
	private String qaTitle;
	private String caCode;
	private String userId;
	private String bizId;
	private String qaAnswer;
	private String qaStatus;
	private Date qaDate;
}
