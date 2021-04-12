package com.kh.lahol.cafe.bus.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Caphoto;

public interface CafeBizDao {
	// 카페 정보 insert
	public int insertCafeInfo(Cafe c);
	
	public List<Cafe> selectCafeList();

	public Cafe selectCafeInfo(String caCode);

	//public int insetCafeInfoPhoto(ArrayList<Caphoto> photoList);
	
	

}
