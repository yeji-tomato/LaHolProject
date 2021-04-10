package com.kh.lahol.member.model.vo;

import java.sql.Date;

public class M_Partner extends Member{
	private Date openDate;
	private int warned;
	
	public M_Partner() {}

	public M_Partner(String id, String pwd, String email, String name, String phone, String addr, Date enDate,
			Date moDate, String isActive, String grade, Date openDate, int warned) {
		super(id, pwd, email, name, phone, addr, enDate, moDate, isActive, grade);
		this.openDate = openDate;
		this.warned = warned;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public int getWarned() {
		return warned;
	}

	public void setWarned(int warned) {
		this.warned = warned;
	}

	@Override
	public String toString() {
		return "M_Partner [openDate=" + openDate + ", warned=" + warned + "]";
	}

}
