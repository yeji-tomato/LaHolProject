package com.kh.lahol.mypage.partner.model.vo;

import java.sql.Date;

public class CoffeeClass {
	private String class_no;
	private String c_code;
	private String cl_name;
	private String cl_des;
	private String tr_name;
	private String tr_intro;
	private String cl_curi;
	private int cl_max;
	private Date cl_date;
	private String cl_loca;
	private int cl_price;
	private String blind;
	private String cl_status;
	private String bus_no;
	private String cl_shortDes;
	private String cl_time;
	private String cl_time2;
	private String cl_time3;
	private String cl_level;
	private String cl_runtime;
	private String class_photo;
	private String cl_thumbnail;
	private String tr_photo;
	private String cl_writer;
	private String cl_category;
	
	// 카페 조인 했을 때
	private String c_name;
	private String c_owner;
	private String c_address;
	private String c_la;
	private String c_lo;
	
	// 신청자 수 조회 뷰 추가했을 때
	private int people;
	
	public CoffeeClass() {}

	public CoffeeClass(String class_no, String c_code, String cl_name, String cl_des, String tr_name, String tr_intro,
			String cl_curi, int cl_max, Date cl_date, String cl_loca, int cl_price, String blind, String cl_status,
			String bus_no, String cl_shortDes, String cl_time, String cl_time2, String cl_time3, String cl_level,
			String cl_runtime, String class_photo, String cl_thumbnail, String tr_photo, String cl_writer,
			String c_name, String c_owner, String c_address, String c_la, String c_lo, int people) {
		super();
		this.class_no = class_no;
		this.c_code = c_code;
		this.cl_name = cl_name;
		this.cl_des = cl_des;
		this.tr_name = tr_name;
		this.tr_intro = tr_intro;
		this.cl_curi = cl_curi;
		this.cl_max = cl_max;
		this.cl_date = cl_date;
		this.cl_loca = cl_loca;
		this.cl_price = cl_price;
		this.blind = blind;
		this.cl_status = cl_status;
		this.bus_no = bus_no;
		this.cl_shortDes = cl_shortDes;
		this.cl_time = cl_time;
		this.cl_time2 = cl_time2;
		this.cl_time3 = cl_time3;
		this.cl_level = cl_level;
		this.cl_runtime = cl_runtime;
		this.class_photo = class_photo;
		this.cl_thumbnail = cl_thumbnail;
		this.tr_photo = tr_photo;
		this.cl_writer = cl_writer;
		this.c_name = c_name;
		this.c_owner = c_owner;
		this.c_address = c_address;
		this.c_la = c_la;
		this.c_lo = c_lo;
		this.people = people;
	}

	public CoffeeClass(String class_no, String c_code, String cl_name, String cl_des, String tr_name, String tr_intro,
			String cl_curi, int cl_max, Date cl_date, String cl_loca, int cl_price, String blind, String cl_status,
			String bus_no, String cl_shortDes, String cl_time, String cl_time2, String cl_time3, String cl_level,
			String cl_runtime, String class_photo, String cl_thumbnail, String tr_photo, String cl_writer,
			String cl_category) {
		super();
		this.class_no = class_no;
		this.c_code = c_code;
		this.cl_name = cl_name;
		this.cl_des = cl_des;
		this.tr_name = tr_name;
		this.tr_intro = tr_intro;
		this.cl_curi = cl_curi;
		this.cl_max = cl_max;
		this.cl_date = cl_date;
		this.cl_loca = cl_loca;
		this.cl_price = cl_price;
		this.blind = blind;
		this.cl_status = cl_status;
		this.bus_no = bus_no;
		this.cl_shortDes = cl_shortDes;
		this.cl_time = cl_time;
		this.cl_time2 = cl_time2;
		this.cl_time3 = cl_time3;
		this.cl_level = cl_level;
		this.cl_runtime = cl_runtime;
		this.class_photo = class_photo;
		this.cl_thumbnail = cl_thumbnail;
		this.tr_photo = tr_photo;
		this.cl_writer = cl_writer;
		this.cl_category = cl_category;
	}

	public String getClass_no() {
		return class_no;
	}

	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getCl_name() {
		return cl_name;
	}

	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}

	public String getCl_des() {
		return cl_des;
	}

	public void setCl_des(String cl_des) {
		this.cl_des = cl_des;
	}

	public String getTr_name() {
		return tr_name;
	}

	public void setTr_name(String tr_name) {
		this.tr_name = tr_name;
	}

	public String getTr_intro() {
		return tr_intro;
	}

	public void setTr_intro(String tr_intro) {
		this.tr_intro = tr_intro;
	}

	public String getCl_curi() {
		return cl_curi;
	}

	public void setCl_curi(String cl_curi) {
		this.cl_curi = cl_curi;
	}

	public int getCl_max() {
		return cl_max;
	}

	public void setCl_max(int cl_max) {
		this.cl_max = cl_max;
	}

	public Date getCl_date() {
		return cl_date;
	}

	public void setCl_date(Date cl_date) {
		this.cl_date = cl_date;
	}

	public String getCl_loca() {
		return cl_loca;
	}

	public void setCl_loca(String cl_loca) {
		this.cl_loca = cl_loca;
	}

	public int getCl_price() {
		return cl_price;
	}

	public void setCl_price(int cl_price) {
		this.cl_price = cl_price;
	}

	public String getBlind() {
		return blind;
	}

	public void setBlind(String blind) {
		this.blind = blind;
	}

	public String getCl_status() {
		return cl_status;
	}

	public void setCl_status(String cl_status) {
		this.cl_status = cl_status;
	}

	public String getBus_no() {
		return bus_no;
	}

	public void setBus_no(String bus_no) {
		this.bus_no = bus_no;
	}

	public String getCl_shortDes() {
		return cl_shortDes;
	}

	public void setCl_shortDes(String cl_shortDes) {
		this.cl_shortDes = cl_shortDes;
	}

	public String getCl_time() {
		return cl_time;
	}

	public void setCl_time(String cl_time) {
		this.cl_time = cl_time;
	}

	public String getCl_time2() {
		return cl_time2;
	}

	public void setCl_time2(String cl_time2) {
		this.cl_time2 = cl_time2;
	}

	public String getCl_time3() {
		return cl_time3;
	}

	public void setCl_time3(String cl_time3) {
		this.cl_time3 = cl_time3;
	}

	public String getCl_level() {
		return cl_level;
	}

	public void setCl_level(String cl_level) {
		this.cl_level = cl_level;
	}

	public String getCl_runtime() {
		return cl_runtime;
	}

	public void setCl_runtime(String cl_runtime) {
		this.cl_runtime = cl_runtime;
	}

	public String getClass_photo() {
		return class_photo;
	}

	public void setClass_photo(String class_photo) {
		this.class_photo = class_photo;
	}

	public String getCl_thumbnail() {
		return cl_thumbnail;
	}

	public void setCl_thumbnail(String cl_thumbnail) {
		this.cl_thumbnail = cl_thumbnail;
	}

	public String getTr_photo() {
		return tr_photo;
	}

	public void setTr_photo(String tr_photo) {
		this.tr_photo = tr_photo;
	}

	public String getCl_writer() {
		return cl_writer;
	}

	public void setCl_writer(String cl_writer) {
		this.cl_writer = cl_writer;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_owner() {
		return c_owner;
	}

	public void setC_owner(String c_owner) {
		this.c_owner = c_owner;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getC_la() {
		return c_la;
	}

	public void setC_la(String c_la) {
		this.c_la = c_la;
	}

	public String getC_lo() {
		return c_lo;
	}

	public void setC_lo(String c_lo) {
		this.c_lo = c_lo;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getCl_category() {
		return cl_category;
	}

	public void setCl_category(String cl_category) {
		this.cl_category = cl_category;
	}

	@Override
	public String toString() {
		return "CoffeeClass [class_no=" + class_no + ", c_code=" + c_code + ", cl_name=" + cl_name + ", cl_des="
				+ cl_des + ", tr_name=" + tr_name + ", tr_intro=" + tr_intro + ", cl_curi=" + cl_curi + ", cl_max="
				+ cl_max + ", cl_date=" + cl_date + ", cl_loca=" + cl_loca + ", cl_price=" + cl_price + ", blind="
				+ blind + ", cl_status=" + cl_status + ", bus_no=" + bus_no + ", cl_shortDes=" + cl_shortDes
				+ ", cl_time=" + cl_time + ", cl_time2=" + cl_time2 + ", cl_time3=" + cl_time3 + ", cl_level="
				+ cl_level + ", cl_runtime=" + cl_runtime + ", class_photo=" + class_photo + ", cl_thumbnail="
				+ cl_thumbnail + ", tr_photo=" + tr_photo + ", cl_writer=" + cl_writer + ", cl_category=" + cl_category
				+ ", c_name=" + c_name + ", c_owner=" + c_owner + ", c_address=" + c_address + ", c_la=" + c_la
				+ ", c_lo=" + c_lo + ", people=" + people + "]";
	}

}
