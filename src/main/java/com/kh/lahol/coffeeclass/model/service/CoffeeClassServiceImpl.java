package com.kh.lahol.coffeeclass.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.coffeeclass.model.dao.CoffeeClassDao;
import com.kh.lahol.coffeeclass.model.vo.ClassRegister;
import com.kh.lahol.coffeeclass.model.vo.ClassSearch;
import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;

@Service
public class CoffeeClassServiceImpl implements CoffeeClassSerivce{
	@Autowired
	private CoffeeClassDao clDao;

	// 조회
	@Override    
	public int selectListCount() {
		return clDao.selectListCount();
	}

	// 페이징
	@Override
	public List<CoffeeClass> selectList(PageInfo pi) {
		return clDao.selectList(pi);
	}

	// 페이지 등록
	@Override
	public int insertClass(CoffeeClass cl) {
		
		return clDao.insertClass(cl);
	}

	// 상세 페이지 조회
	@Override
	public CoffeeClass selectCoffeeClass(String classNo) {
		return clDao.selectCoffeeClass(classNo);
	}
	
	// 수정페이지 조회
	@Override
	public CoffeeClass bringClassInfo(String classNo) {
		return clDao.bringClassInfo(classNo);
	}

	// 수정
	@Override
	public int updateClass(CoffeeClass cl) {
		return clDao.updateClass(cl);
	}
	
	// 삭제 (status D로 변경)
	@Override
	public int deleteClass(CoffeeClass cl) {
		return clDao.deleteClass(cl);
	}

	// 클래스 신고
	@Override
	public int reportClass(CoffeeClass cl) {
		System.out.println("service : " + cl);
		return clDao.reportClass(cl);
	}

	// 클래스 댓글 신고
	@Override
	public int reportClComment(CoffeeClass cl) {
		return clDao.reportClComment(cl);
	}

	// 클래스 신청
	@Override
	public int registerClass(ClassRegister clRegi) {
		return clDao.registerClass(clRegi);
	}

	// 검색
	@Override
	public List<ClassSearch> searchList(ClassSearch search) {
		return clDao.selectClassSearch(search);
	}

	// 필터
	@Override
	public List<ClassSearch> filterList(ClassSearch search) {
		return clDao.selectClassFilter(search);
	}




}
