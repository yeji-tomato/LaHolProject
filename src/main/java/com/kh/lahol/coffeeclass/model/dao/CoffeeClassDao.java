package com.kh.lahol.coffeeclass.model.dao;

import java.util.List;

import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;

public interface CoffeeClassDao {
	
		// 1. 게시글 수 카운트
		public int selectListCount();
		
		// 2. 페이징 처리 된 게시글 목록 조회
		public List<CoffeeClass> selectList(PageInfo pi);
		
		// 3. 클래스 개설하기
		public int insertClass(CoffeeClass cl);
		
		// 4. 클래스 상세정보 보기
		public CoffeeClass selectCoffeeClass(int clid);
		
		// 5. 클래스 수정하기 
		public int updateClass(CoffeeClass cl);
		
		// 6. 클래스 삭제하기 
		public int deleteClass(int clid);
		

}
