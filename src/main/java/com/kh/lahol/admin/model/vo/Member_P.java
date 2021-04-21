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
public class Member_P {
	// ID 카페 대표자 주소 연락처 이메일 경고 가입일 상태
	private String id;
	private String cafe;
	private String name;
	private String addr;
	private String phone;
	private String email;
	private int warned;
	private String enDate;
	private String isActive;
}
