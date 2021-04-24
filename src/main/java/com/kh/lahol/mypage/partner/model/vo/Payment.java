package com.kh.lahol.mypage.partner.model.vo;

import java.sql.Date;

public class Payment {
	private String pay_no;
	private String pay_item;
	private String pay_price;
	private String subscribe;
	private Date pay_date;
	private String id;
	private String cafe_res;
	private String ad_code;
	private String purchase_number;
	private String subscribe_code;
	private String cl_pay_no;
	private String pay_dc;
	private String pay_total;
	private String cl_time;
	
	public Payment() {}

	public Payment(String pay_no, String pay_item, String pay_price, String subscribe, Date pay_date, String id,
			String cafe_res, String ad_code, String purchase_number, String subscribe_code, String cl_pay_no,
			String pay_dc, String pay_total, String cl_time) {
		super();
		this.pay_no = pay_no;
		this.pay_item = pay_item;
		this.pay_price = pay_price;
		this.subscribe = subscribe;
		this.pay_date = pay_date;
		this.id = id;
		this.cafe_res = cafe_res;
		this.ad_code = ad_code;
		this.purchase_number = purchase_number;
		this.subscribe_code = subscribe_code;
		this.cl_pay_no = cl_pay_no;
		this.pay_dc = pay_dc;
		this.pay_total = pay_total;
		this.cl_time = cl_time;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getPay_item() {
		return pay_item;
	}

	public void setPay_item(String pay_item) {
		this.pay_item = pay_item;
	}

	public String getPay_price() {
		return pay_price;
	}

	public void setPay_price(String pay_price) {
		this.pay_price = pay_price;
	}

	public String getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCafe_res() {
		return cafe_res;
	}

	public void setCafe_res(String cafe_res) {
		this.cafe_res = cafe_res;
	}

	public String getAd_code() {
		return ad_code;
	}

	public void setAd_code(String ad_code) {
		this.ad_code = ad_code;
	}

	public String getPurchase_number() {
		return purchase_number;
	}

	public void setPurchase_number(String purchase_number) {
		this.purchase_number = purchase_number;
	}

	public String getSubscribe_code() {
		return subscribe_code;
	}

	public void setSubscribe_code(String subscribe_code) {
		this.subscribe_code = subscribe_code;
	}

	public String getCl_pay_no() {
		return cl_pay_no;
	}

	public void setCl_pay_no(String cl_pay_no) {
		this.cl_pay_no = cl_pay_no;
	}

	public String getPay_dc() {
		return pay_dc;
	}

	public void setPay_dc(String pay_dc) {
		this.pay_dc = pay_dc;
	}

	public String getPay_total() {
		return pay_total;
	}

	public void setPay_total(String pay_total) {
		this.pay_total = pay_total;
	}

	public String getCl_time() {
		return cl_time;
	}

	public void setCl_time(String cl_time) {
		this.cl_time = cl_time;
	}

	@Override
	public String toString() {
		return "Payment [pay_no=" + pay_no + ", pay_item=" + pay_item + ", pay_price=" + pay_price + ", subscribe="
				+ subscribe + ", pay_date=" + pay_date + ", id=" + id + ", cafe_res=" + cafe_res + ", ad_code="
				+ ad_code + ", purchase_number=" + purchase_number + ", subscribe_code=" + subscribe_code
				+ ", cl_pay_no=" + cl_pay_no + ", pay_dc=" + pay_dc + ", pay_total=" + pay_total + ", cl_time="
				+ cl_time + "]";
	}

}
