package com.kh.lahol.mypage.normal.model.vo;

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
public class StoreReview {
	private String review_no;
	private Date review_date;
	private double review_grade;
	private String review_content;
	private String review_photo;
	private String review_chph;
	private String review_path;
	private String review_status;
	private String purchase_number;
	private String subscribe_code;
	private String id;
}
