package com.kh.lahol.coffeeclass.model.service;

import java.util.List;

import com.kh.lahol.coffeeclass.model.vo.ClassRegister;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;


public interface CoffeeClassSerivce {
	// 1. 게시글 수 카운트
	public int selectListCount();
	
	// 2. 페이징 처리 된 게시글 목록 조회
	public List<CoffeeClass> selectList(PageInfo pi);
	
	// 3. 클래스 개설하기
	public int insertClass(CoffeeClass cl);
	
	// 4. 클래스 상세정보 보기
	public CoffeeClass selectCoffeeClass(String classNo);
	
	// 5. 클래스 수정페이지 불러오기
	public CoffeeClass bringClassInfo(String classNo);
	
	// 6. 클래스 수정하기 
	public int updateClass(CoffeeClass cl);
	
	// 7. 클래스 삭제하기 
	public int deleteClass(CoffeeClass cl);

	// 8. 클래스 신고하기
	public int reportClass(CoffeeClass cl);
	
	// 9. 클래스 댓글 신고하기
	public int reportClComment(CoffeeClass cl);

	// 10. 클래스 수강신청
	public int registerMember(ClassRegister clRegi);



	
}
