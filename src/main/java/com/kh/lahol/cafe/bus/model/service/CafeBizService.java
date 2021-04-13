package com.kh.lahol.cafe.bus.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;

public interface CafeBizService {
	// 카페 정보 insert
	public int insertCafeInfo(Cafe c);

	// 카페 정보 목록 조회
	List<Cafe> selectCafeList();
	
	// 카페 정보 수정
	int updateCafeInfo(Cafe c);
	
	// 카페 정보 삭제
	int deleteCafeInfo(String caCode);

	// 카페 시퀀스 번호를 통한 조회
	public Cafe selectCafeInfo(String caCode);
	
	

}
