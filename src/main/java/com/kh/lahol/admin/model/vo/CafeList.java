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

// 필드 추가해야함!!! 
public class CafeList {
	private String id;
	private String cafe;
	private String phone;
	private String sales;
	private String openDate;
}
