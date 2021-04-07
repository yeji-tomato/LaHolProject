package com.kh.lahol.member.model.vo;

import java.sql.Date;

public class M_Normal extends Member {
	private int blind;
	private String isPostable;
	private String nickname;
	
	public M_Normal() {}

	public M_Normal(String id, String pwd, String email, String name, String phone, String addr, Date enDate,
			Date moDate, String isActive, String grade, int blind, String isPostable, String nickname) {
		super(id, pwd, email, name, phone, addr, enDate, moDate, isActive, grade);
		this.blind = blind;
		this.isPostable = isPostable;
		this.nickname = nickname;
	}

	public int getBlind() {
		return blind;
	}

	public void setBlind(int blind) {
		this.blind = blind;
	}

	public String getIsPostable() {
		return isPostable;
	}

	public void setIsPostable(String isPostable) {
		this.isPostable = isPostable;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "M_Normal [blind=" + blind + ", isPostable=" + isPostable + ", nickname=" + nickname + "]";
	};
	
}
