package com.kh.lahol.coffeeclass.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Paging {

	private Integer pageNum;  // 현재 페이지 번호
	private Integer pageSize; // 페이장 데이터 갯수
	
	public Paging(Integer pageNum, Integer pageSize) {
		this.pageNum = pageNum;
		this.pageSize = pageSize;
	}
}
