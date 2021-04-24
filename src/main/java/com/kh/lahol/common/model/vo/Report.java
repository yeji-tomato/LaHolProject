package com.kh.lahol.common.model.vo;

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
public class Report {
	private String reportNo;
	private String reportType;
	private String reportReason;
	private String iswarned;
	private String ischecked;
	private String imgName;
	private String imgPath;
	private String imgChName;
	private String reporterId;
	private String itemCode;
	private String reporteeId;
}
