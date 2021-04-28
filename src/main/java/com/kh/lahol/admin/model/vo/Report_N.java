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
public class Report_N {
	private String reportNo;
	private String reportType;
	private String reportReason;
	private String accu;
	private String isWarned;
	private String imgName;
	private String hasImg;
	private String imgPath;
	private String imgChName;
	private String reporter;
	private String reportee;
	private String itemCode;
	private String storeReviewContent;
	private String cafeReviewContent;
	private String classReviewContent;
}
