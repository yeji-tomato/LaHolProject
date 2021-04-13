package com.kh.lahol.cafe.bus.model.vo;

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
public class Coffee {
	private String cfNo;
	private String cfCategory;
	private String cfIname;
	private String cfIchname;
	private String chIpath;
	private String cfName;
	private int cfPrice;
	private int cfCount;
	private String caCode;	
}
