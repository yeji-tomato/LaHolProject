package com.kh.lahol.coffeeclass.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.coffeeclass.model.vo.ClassQnA;
import com.kh.lahol.coffeeclass.model.vo.ClassRegister;
import com.kh.lahol.coffeeclass.model.vo.ClassSearch;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;
import com.kh.lahol.coffeeclass.model.vo.Paging;
import com.kh.lahol.common.model.vo.Payment;

@Repository
public class CoffeeClassDaoImpl implements CoffeeClassDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return sqlSession.selectOne("clMapper.selectListCount");
	}

	// 클래스 메인화면 불러오기 
	@Override
	public List<CoffeeClass> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("clMapper.selectList", null, rowBounds);
	}

	// 클래스 상세 페이지 접근
	@Override
	public CoffeeClass selectCoffeeClass(String classNo) {
		return sqlSession.selectOne("clMapper.selectClass", classNo);
	}
	
	// 클래스 수정 페이지 불러오기
	@Override
	public int insertClass(CoffeeClass cl) {
		System.out.println("dao : " + cl);
		return sqlSession.insert("clMapper.insertClass", cl);
	}

	// 수정 페이지 접근
	@Override
	public CoffeeClass bringClassInfo(String classNo) {
		return sqlSession.selectOne("clMapper.bringClass", classNo);
	}
	
	// 수정
	@Override
	public int updateClass(CoffeeClass cl) {
		return sqlSession.update("clMapper.updateClass", cl);
	}

	// 삭제
	@Override
	public int deleteClass(CoffeeClass cl) {
		return sqlSession.delete("clMapper.deleteClass", cl);
	}

	// 클래스 신고
	@Override
	public int reportClass(CoffeeClass cl) {
		return sqlSession.insert("clMapper.reportClass", cl);
	}

	// 클래스 댓글 신고
	@Override
	public int reportClComment(CoffeeClass cl) {
		return sqlSession.insert("clMapper.reportClComment", cl);
	}

	// 클래스 수강신청
	@Override
	public int registerClass(Payment classPay) {
		return sqlSession.selectOne("clMapper.registerClass", classPay);
	}

	// 검색
	@Override
	public List<ClassSearch> selectClassSearch(ClassSearch search) {
		return sqlSession.selectList("clMapper.searchClass", search);
	}

	// 필터
	@Override
	public List<ClassSearch> selectClassFilter(ClassSearch search) {
		return sqlSession.selectList("clMapper.filterClass", search);
	}

	// 세션 정보 불러오기 
	@Override
	public Cafe selectCafeInfoById(String id) {
		return sqlSession.selectOne("clMapper.selectCafeInfoById", id);
	}

	// 클래스 QnA 불러오기
	@Override
	public List<ClassQnA> selectQnA(ClassQnA classqna) {
		return sqlSession.selectList("clMapper.selectQnA", classqna);
	}
	
	// 클래스 QnA 질문
	@Override
	public int askClass(ClassQnA qna) {
		return sqlSession.insert("clMapper.askClass", qna);
	}

	// 클래스 QnA 답변
	@Override
	public int answerClass(ClassQnA qna) {
		return sqlSession.insert("clMapper.answerClass", qna);
	}

	// new 페이징
	@Override
	public List<CoffeeClass> selectListWithPaging(Paging paging) {
		return sqlSession.selectList("clMapper.selectListWithPaging", paging);
	}



}
