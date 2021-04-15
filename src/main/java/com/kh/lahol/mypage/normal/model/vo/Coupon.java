package com.kh.lahol.mypage.normal.model.vo;

import java.sql.Date;

public class Coupon {
	private String coupon_code;
	private String id;
	private String coupon_name;
	private int limit;
	private String issuedBy;
	private Date issueDate;
	private Date expDate;
	private String isUsed;
	
	public Coupon() {}

	public Coupon(String coupon_code, String id, String coupon_name, int limit, String issuedBy, Date issueDate,
			Date expDate, String isUsed) {
		super();
		this.coupon_code = coupon_code;
		this.id = id;
		this.coupon_name = coupon_name;
		this.limit = limit;
		this.issuedBy = issuedBy;
		this.issueDate = issueDate;
		this.expDate = expDate;
		this.isUsed = isUsed;
	}

	public String getCoupon_code() {
		return coupon_code;
	}

	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getIssuedBy() {
		return issuedBy;
	}

	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	public String getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "Coupon [coupon_code=" + coupon_code + ", id=" + id + ", coupon_name=" + coupon_name + ", limit=" + limit
				+ ", issuedBy=" + issuedBy + ", issueDate=" + issueDate + ", expDate=" + expDate + ", isUsed=" + isUsed
				+ "]";
	}
	
}
