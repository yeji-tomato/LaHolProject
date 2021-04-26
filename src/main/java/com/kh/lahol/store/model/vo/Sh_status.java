package com.kh.lahol.store.model.vo;

 

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
public class Sh_status {

	private String sh_code;
	private String pay_no;
	private String sh_status;
	private Date sh_date;
}
