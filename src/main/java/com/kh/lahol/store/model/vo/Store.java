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
public class Store {
	private String PR_CODE;
	private String ST_CATAGORY;
	private String PR_NAME;
	private String PR_IF;
	private String PR_EVENT;
	private String ORIGIN;
	private String PR_PRICE;
	private String SUBSCRIPTIONS;
	private String STORE_PHOTO1;
	private String STORE_PHOTO2;
	private String STORE_PHOTO3;
	private String DY_COMPANY;
	private String PR_INF;
	private String SERVICE_CENTER;
	private Date PR_DATE;
	private String PR_NOTICE;
	private String PR_STATUS;
	private String C_CODE;
	private int SCOUNT;
	
}
