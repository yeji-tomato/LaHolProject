package com.kh.lahol.store.model.service;

import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Search; 
import com.kh.lahol.store.model.vo.Store;
import com.kh.lahol.store.model.vo.Sub;
import com.kh.lahol.store.model.vo.storeA;
import com.kh.lahol.store.model.vo.storeQ;

public interface StoreService {
	//.1 게시글 수 카운트
	public int selectListCount();
	
	//2. 페이징 처리 된 게시글 목록 조회
	public List<Store> selectList(PageInfo pi);
	
	public List<Store> selectList2(PageInfo pi2);
	
	//스토어 관리자 페이지
	public List<Store> myselectList(PageInfo pi, String id);
	// 내가쓴글 카운트
	public int mySearchCount(String id);

	//7. 게시글 검색
	public List<Store> searchList( Search search, PageInfo pi);
	// 검색된 게시글 카운트
	public int selectSearchCount(Search search);
	//내가쓴 게시글 카운트 
	
	//4. 디테일 뷰
	public Store selectStore(int pR_CODE, boolean falg);
	
	//게시글작성
	public int insertStore(Store s );

	public int deleteStore(int pR_CODE);

	public int updateStore(Store s);

	
	//제품에 달린 질문 리스트 
	public List<storeQ> QsearchList(Search sc, PageInfo pi);
	
	//질분번호 답변
	public int insertAnser(storeA s);
	//답변 리스트 
	public List<storeA> AsearchList(Search sc, PageInfo pi);

	public int insertQuestion(storeQ q);

	public List<Cafe> CafeCode(Search cd);

	public int subscribe(Sub sb);

 

	


	
	
	
}
