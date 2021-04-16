package com.kh.lahol.store.model.vo;

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
public class storeQ {
	private String qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate; 
	private String PR_CODE; 
	private String id; 
	
}
