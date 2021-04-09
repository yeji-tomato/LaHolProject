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
	
	public Member () {}

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

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", email=" + email + ", name=" + name + ", phone=" + phone
				+ ", addr=" + addr + ", enDate=" + enDate + ", moDate=" + moDate + ", isActive=" + isActive + ", grade="
				+ grade + "]";
	};
	
}
