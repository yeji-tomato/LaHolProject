package com.kh.lahol.member.model.vo;

import java.sql.Date;

public class Cafe {
	private String c_code;
	private String c_name;
	private String c_owner;
	private String c_number;
	private String c_address;
	private String c_status;
	private String c_la;
	private String c_lo;
	private String id;
	private Date startTime;
	private String c_wifi;
	private String c_toilet;
	private String c_parking;
	private String c_message;
	private String c_resper;
	private Date endTime;
	
	public Cafe () {}

	public Cafe(String c_code, String c_name, String c_owner, String c_number, String c_address, String c_status,
			String c_la, String c_lo, String id, Date startTime, String c_wifi, String c_toilet, String c_parking,
			String c_message, String c_resper, Date endTime) {
		super();
		this.c_code = c_code;
		this.c_name = c_name;
		this.c_owner = c_owner;
		this.c_number = c_number;
		this.c_address = c_address;
		this.c_status = c_status;
		this.c_la = c_la;
		this.c_lo = c_lo;
		this.id = id;
		this.startTime = startTime;
		this.c_wifi = c_wifi;
		this.c_toilet = c_toilet;
		this.c_parking = c_parking;
		this.c_message = c_message;
		this.c_resper = c_resper;
		this.endTime = endTime;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
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

	public String getC_number() {
		return c_number;
	}

	public void setC_number(String c_number) {
		this.c_number = c_number;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getC_status() {
		return c_status;
	}

	public void setC_status(String c_status) {
		this.c_status = c_status;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getC_wifi() {
		return c_wifi;
	}

	public void setC_wifi(String c_wifi) {
		this.c_wifi = c_wifi;
	}

	public String getC_toilet() {
		return c_toilet;
	}

	public void setC_toilet(String c_toilet) {
		this.c_toilet = c_toilet;
	}

	public String getC_parking() {
		return c_parking;
	}

	public void setC_parking(String c_parking) {
		this.c_parking = c_parking;
	}

	public String getC_message() {
		return c_message;
	}

	public void setC_message(String c_message) {
		this.c_message = c_message;
	}

	public String getC_resper() {
		return c_resper;
	}

	public void setC_resper(String c_resper) {
		this.c_resper = c_resper;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "Cafe [c_code=" + c_code + ", c_name=" + c_name + ", c_owner=" + c_owner + ", c_number=" + c_number
				+ ", c_address=" + c_address + ", c_status=" + c_status + ", c_la=" + c_la + ", c_lo=" + c_lo + ", id="
				+ id + ", startTime=" + startTime + ", c_wifi=" + c_wifi + ", c_toilet=" + c_toilet + ", c_parking="
				+ c_parking + ", c_message=" + c_message + ", c_resper=" + c_resper + ", endTime=" + endTime + "]";
	}

}
