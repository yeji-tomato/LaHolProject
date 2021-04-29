package com.kh.lahol.admin.model.vo;

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
public class Game {
	private String seq;
	private String id;
	private String couponName;
	private String couponLimit;
	private String issuedBy;
	private String issueDate;
	private String expDate;
	private String isUsed;
}
