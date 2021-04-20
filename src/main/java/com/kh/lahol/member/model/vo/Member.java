package com.kh.lahol.member.model.vo;

import java.sql.Date;

public class Member {
	private String id;
	private String pwd;
	private String email;
	private String name;
	private String phone;
	private String addr;
	private Date enDate;
	private Date moDate;
	private String isActive;
	private String grade;
	
	private Date pay_date;

	public Member(){}
	
	public Member(String id, String pwd, String email, String name, String phone, String addr, Date enDate, Date moDate,
			String isActive, String grade) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.enDate = enDate;
		this.moDate = moDate;
		this.isActive = isActive;
		this.grade = grade;
	}
	
	public Member(String id, String name, String phone, String email, String isActive) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.isActive = isActive;
	}

	public Member(String id, String email, String name, String phone, String isActive, String grade) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.isActive = isActive;
		this.grade = grade;
	}

	public Member(String id, String email, String name, String phone, Date pay_date) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.pay_date = pay_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getEnDate() {
		return enDate;
	}

	public void setEnDate(Date enDate) {
		this.enDate = enDate;
	}

	public Date getMoDate() {
		return moDate;
	}

	public void setMoDate(Date moDate) {
		this.moDate = moDate;
	}

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", email=" + email + ", name=" + name + ", phone=" + phone
				+ ", addr=" + addr + ", enDate=" + enDate + ", moDate=" + moDate + ", isActive=" + isActive + ", grade="
				+ grade + ", pay_date=" + pay_date + "]";
	}

}
