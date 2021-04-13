package com.kh.lahol.mypage.partner.model.vo;

import java.sql.Date;

public class Ad {
	private String ad_code;
	private Date applyDate;
	private Date postDate;
	private int duration;
	private String origin_image;
	private String rename_image;
	private String image;
	private String url;
	private String ad_status;
	private String ad_reject;
	private String id;
	private String bn_code;
	
	public Ad () {}

	public Ad(String ad_code, Date applyDate, Date postDate, int duration, String origin_image, String rename_image,
			String image, String url, String ad_status, String ad_reject, String id, String bn_code) {
		super();
		this.ad_code = ad_code;
		this.applyDate = applyDate;
		this.postDate = postDate;
		this.duration = duration;
		this.origin_image = origin_image;
		this.rename_image = rename_image;
		this.image = image;
		this.url = url;
		this.ad_status = ad_status;
		this.ad_reject = ad_reject;
		this.id = id;
		this.bn_code = bn_code;
	}

	public String getAd_code() {
		return ad_code;
	}

	public void setAd_code(String ad_code) {
		this.ad_code = ad_code;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getOrigin_image() {
		return origin_image;
	}

	public void setOrigin_image(String origin_image) {
		this.origin_image = origin_image;
	}

	public String getRename_image() {
		return rename_image;
	}

	public void setRename_image(String rename_image) {
		this.rename_image = rename_image;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAd_status() {
		return ad_status;
	}

	public void setAd_status(String ad_status) {
		this.ad_status = ad_status;
	}

	public String getAd_reject() {
		return ad_reject;
	}

	public void setAd_reject(String ad_reject) {
		this.ad_reject = ad_reject;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBn_code() {
		return bn_code;
	}

	public void setBn_code(String bn_code) {
		this.bn_code = bn_code;
	}

	@Override
	public String toString() {
		return "Ad [ad_code=" + ad_code + ", applyDate=" + applyDate + ", postDate=" + postDate + ", duration="
				+ duration + ", origin_image=" + origin_image + ", rename_image=" + rename_image + ", image=" + image
				+ ", url=" + url + ", ad_status=" + ad_status + ", ad_reject=" + ad_reject + ", id=" + id + ", bn_code="
				+ bn_code + "]";
	}
	
}
