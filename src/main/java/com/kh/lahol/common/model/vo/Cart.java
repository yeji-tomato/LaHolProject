package com.kh.lahol.common.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Cart {
	private String cartNo; 		// 장바구니 번호
	private String cartName;	// 제품명/클래스명
	private int cartPrice;		// 가격
	private int cartCount;		// 수량
	private String cartRes;  	// 예약
	private int shipFee;		// 배송비
	private String classNo;		// 클래스 고유번호
	private String userId;			// 아이디
	private String purchaseNo;	// 제품구매번호
	private String cres;		// 카페예약번호
	private String photoName; 	// 대표사진
	private Date today;			// 장바구니에 담은 날짜
	private String clTime;		// 클래스타임
}
