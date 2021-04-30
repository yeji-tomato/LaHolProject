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
public class bevOrder {
	private String cfResNo;
	private String cfResHI;
	private String cfResCap;
	private String cfResCup;
	private String caResNo;
	private int cfResAmount;
	private String cfNo;
	private String cfIchname;
	private String cfName;

}
