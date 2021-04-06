package com.kh.lahol.store.model.vo;

import java.sql.Date;
 

 

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
	
	public Store() {}

	public Store(String pR_CODE, String sT_CATAGORY, String pR_NAME, String pR_IF, String pR_EVENT, String oRIGIN,
			String pR_PRICE, String sUBSCRIPTIONS, String sTORE_PHOTO1, String sTORE_PHOTO2, String sTORE_PHOTO3,
			String dY_COMPANY, String pR_INF, String sERVICE_CENTER, Date pR_DATE, String pR_NOTICE, String pR_STATUS,
			String c_CODE) {
		super();
		PR_CODE = pR_CODE;
		ST_CATAGORY = sT_CATAGORY;
		PR_NAME = pR_NAME;
		PR_IF = pR_IF;
		PR_EVENT = pR_EVENT;
		ORIGIN = oRIGIN;
		PR_PRICE = pR_PRICE;
		SUBSCRIPTIONS = sUBSCRIPTIONS;
		STORE_PHOTO1 = sTORE_PHOTO1;
		STORE_PHOTO2 = sTORE_PHOTO2;
		STORE_PHOTO3 = sTORE_PHOTO3;
		DY_COMPANY = dY_COMPANY;
		PR_INF = pR_INF;
		SERVICE_CENTER = sERVICE_CENTER;
		PR_DATE = pR_DATE;
		PR_NOTICE = pR_NOTICE;
		PR_STATUS = pR_STATUS;
		C_CODE = c_CODE;
	}

	public String getPR_CODE() {
		return PR_CODE;
	}

	public void setPR_CODE(String pR_CODE) {
		PR_CODE = pR_CODE;
	}

	public String getST_CATAGORY() {
		return ST_CATAGORY;
	}

	public void setST_CATAGORY(String sT_CATAGORY) {
		ST_CATAGORY = sT_CATAGORY;
	}

	public String getPR_NAME() {
		return PR_NAME;
	}

	public void setPR_NAME(String pR_NAME) {
		PR_NAME = pR_NAME;
	}

	public String getPR_IF() {
		return PR_IF;
	}

	public void setPR_IF(String pR_IF) {
		PR_IF = pR_IF;
	}

	public String getPR_EVENT() {
		return PR_EVENT;
	}

	public void setPR_EVENT(String pR_EVENT) {
		PR_EVENT = pR_EVENT;
	}

	public String getORIGIN() {
		return ORIGIN;
	}

	public void setORIGIN(String oRIGIN) {
		ORIGIN = oRIGIN;
	}

	public String getPR_PRICE() {
		return PR_PRICE;
	}

	public void setPR_PRICE(String pR_PRICE) {
		PR_PRICE = pR_PRICE;
	}

	public String getSUBSCRIPTIONS() {
		return SUBSCRIPTIONS;
	}

	public void setSUBSCRIPTIONS(String sUBSCRIPTIONS) {
		SUBSCRIPTIONS = sUBSCRIPTIONS;
	}

	public String getSTORE_PHOTO1() {
		return STORE_PHOTO1;
	}

	public void setSTORE_PHOTO1(String sTORE_PHOTO1) {
		STORE_PHOTO1 = sTORE_PHOTO1;
	}

	public String getSTORE_PHOTO2() {
		return STORE_PHOTO2;
	}

	public void setSTORE_PHOTO2(String sTORE_PHOTO2) {
		STORE_PHOTO2 = sTORE_PHOTO2;
	}

	public String getSTORE_PHOTO3() {
		return STORE_PHOTO3;
	}

	public void setSTORE_PHOTO3(String sTORE_PHOTO3) {
		STORE_PHOTO3 = sTORE_PHOTO3;
	}

	public String getDY_COMPANY() {
		return DY_COMPANY;
	}

	public void setDY_COMPANY(String dY_COMPANY) {
		DY_COMPANY = dY_COMPANY;
	}

	public String getPR_INF() {
		return PR_INF;
	}

	public void setPR_INF(String pR_INF) {
		PR_INF = pR_INF;
	}

	public String getSERVICE_CENTER() {
		return SERVICE_CENTER;
	}

	public void setSERVICE_CENTER(String sERVICE_CENTER) {
		SERVICE_CENTER = sERVICE_CENTER;
	}

	public Date getPR_DATE() {
		return PR_DATE;
	}

	public void setPR_DATE(Date pR_DATE) {
		PR_DATE = pR_DATE;
	}

	public String getPR_NOTICE() {
		return PR_NOTICE;
	}

	public void setPR_NOTICE(String pR_NOTICE) {
		PR_NOTICE = pR_NOTICE;
	}

	public String getPR_STATUS() {
		return PR_STATUS;
	}

	public void setPR_STATUS(String pR_STATUS) {
		PR_STATUS = pR_STATUS;
	}

	public String getC_CODE() {
		return C_CODE;
	}

	public void setC_CODE(String c_CODE) {
		C_CODE = c_CODE;
	}

	@Override
	public String toString() {
		return "Store [PR_CODE=" + PR_CODE + ", ST_CATAGORY=" + ST_CATAGORY + ", PR_NAME=" + PR_NAME + ", PR_IF="
				+ PR_IF + ", PR_EVENT=" + PR_EVENT + ", ORIGIN=" + ORIGIN + ", PR_PRICE=" + PR_PRICE
				+ ", SUBSCRIPTIONS=" + SUBSCRIPTIONS + ", STORE_PHOTO1=" + STORE_PHOTO1 + ", STORE_PHOTO2="
				+ STORE_PHOTO2 + ", STORE_PHOTO3=" + STORE_PHOTO3 + ", DY_COMPANY=" + DY_COMPANY + ", PR_INF=" + PR_INF
				+ ", SERVICE_CENTER=" + SERVICE_CENTER + ", PR_DATE=" + PR_DATE + ", PR_NOTICE=" + PR_NOTICE
				+ ", PR_STATUS=" + PR_STATUS + ", C_CODE=" + C_CODE + "]";
	}
	
	
}
