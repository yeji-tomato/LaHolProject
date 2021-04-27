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
public class CafeList {
	private String cafeName;
	private String storeSales;
	private String classSales;
	private String cafeSales;
	private String totalSales;
	private String phone;
	private String openDate;
}
