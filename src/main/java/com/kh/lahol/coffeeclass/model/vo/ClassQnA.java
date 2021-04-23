package com.kh.lahol.coffeeclass.model.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class ClassQnA {
	
	private String qnaNo;
	private String classNo;
	private String question;
	private String userId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date askDate;
	private String answer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date answerDate;
	
}
