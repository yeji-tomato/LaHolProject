package com.kh.lahol.cafe.user.model.service;

import com.kh.lahol.cafe.user.model.vo.CafeRes;

public interface CafeService {
	// 1. 카페 매장 예약 insert
	public int hereInsertRes(CafeRes r);
	// 2. 카페 포장 예약 insert
	public int togoInsertRes(CafeRes r);

}
