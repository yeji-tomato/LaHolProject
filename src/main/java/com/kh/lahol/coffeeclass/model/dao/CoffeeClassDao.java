package com.kh.lahol.coffeeclass.model.dao;

import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.coffeeclass.model.vo.ClassQnA;
import com.kh.lahol.coffeeclass.model.vo.ClassRegister;
import com.kh.lahol.coffeeclass.model.vo.ClassSearch;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;
import com.kh.lahol.coffeeclass.model.vo.Paging;
import com.kh.lahol.common.model.vo.Payment;
import com.kh.lahol.mypage.normal.model.vo.ClassReview;

public interface CoffeeClassDao {

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
		public int registerClass(List<Object> list);

		// 11. 검색
		public List<ClassSearch> selectClassSearch(ClassSearch search);

		// 12. 필터
		public List<ClassSearch> selectClassFilter(ClassSearch search);

		// 로그인 유저 세션 정보 불러오기
		public Cafe selectCafeInfoById(String id);

		// 13. 클래스 정보 불러오기
		public List<ClassQnA> selectQnA(ClassQnA classqna);
		
		// 14. 클래스 QnA 질문
		public int askClass(ClassQnA qna);

		// 15. 클래스 QnA 답변
		public int answerClass(ClassQnA qna);

		// 17. 클래스 후기 불러오기
		public List<ClassReview> selectReviews(String classNo);

		// 18. CL_ORDER INSERT
		public int registerClOrder(String clPayNo);

		// 19. CL_PAY INSERT
		public int registerClPay();
		


	
		
		

}
