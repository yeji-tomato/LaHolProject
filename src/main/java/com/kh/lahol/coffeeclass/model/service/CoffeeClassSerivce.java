package com.kh.lahol.coffeeclass.model.service;

import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.coffeeclass.model.vo.ClassQnA;
import com.kh.lahol.coffeeclass.model.vo.ClassRegister;
import com.kh.lahol.coffeeclass.model.vo.ClassSearch;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;
import com.kh.lahol.coffeeclass.model.vo.Paging;
import com.kh.lahol.common.model.vo.Cart;


public interface CoffeeClassSerivce {
	// 1. 게시글 수 카운트
	public int selectListCount();
	
	// 2. 페이징 처리 된 게시글 목록 조회
	public List<CoffeeClass> selectList(PageInfo pi);
	
	// 3. 클래스 개설하기
	public int insertClass(CoffeeClass cl);
	public Cafe selectCafeInfoById(String id);	// 현재 로그인한 사람 정보 세션을 통해 불러오기
	
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
	public int registerClass(ClassRegister clRegi);

	// 11. 검색
	public List<ClassSearch> searchList(ClassSearch search);

	// 12. 필터
	public List<ClassSearch> filterList(ClassSearch search);

	// 13. QnA 정보 불러오기
	public List<ClassQnA> selectQnA(ClassQnA classqna);
	
	// 14. QnA 질문 등록
	public int askClass(ClassQnA qna);

	// 15. QnA 답변 등록
	public int answerClass(ClassQnA qna);

	// 16. 페이징
	public List<CoffeeClass> selectListWithPaging(Paging paging);




	
}
