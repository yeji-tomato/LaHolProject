package com.kh.lahol.cafe.bus.model.vo;

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
public class Cafe {
	private String caCode;
	private String caName;
	private String caOwner;
	private String caNumber;
	private String caAddress;
	private String caStatus;
	private String caLa;
	private String caLo;
	private String caId;
	private Date caStartTime;
	private String wifi;
	private String toilet;
	private String parking;
	private String message;
	private Number resPer;
	private Date caEndTime;

}
