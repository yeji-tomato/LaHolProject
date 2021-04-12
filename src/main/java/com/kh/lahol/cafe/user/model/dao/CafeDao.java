package com.kh.lahol.cafe.user.model.dao;

import com.kh.lahol.cafe.user.model.vo.CafeRes;

public interface CafeDao {
	// 1. 카페 매장 예약 insert
	int hereInsertRes(CafeRes r);
	// 2. 카페 포장 예약 insert
	int togoInsertRes(CafeRes r);

}
