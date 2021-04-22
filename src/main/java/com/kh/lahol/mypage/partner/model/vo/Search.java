package com.kh.lahol.mypage.partner.model.vo;

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
public class Search {
	private String searchCondition;
	private String search;
	private String period_start;
	private String period_end;
	private String id;
}
