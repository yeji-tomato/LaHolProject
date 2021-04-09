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
public class Res {
	private String caResNo;
	private String caResType;
	private Date caResDate;
	private Date caResStaTime;
	private Number caResPer;
	private String caNo;
	private String userId;
	private String caResEndTime;

}
