package com.kh.lahol.store.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.mypage.normal.model.vo.StoreReview;
import com.kh.lahol.store.model.dao.StoreDao;
import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Payment;
import com.kh.lahol.store.model.vo.Pr_pay_w;
import com.kh.lahol.store.model.vo.Prpay;
import com.kh.lahol.store.model.vo.Search;
import com.kh.lahol.store.model.vo.Sh_status;
import com.kh.lahol.store.model.vo.Store;
import com.kh.lahol.store.model.vo.StoreReview2;
import com.kh.lahol.store.model.vo.Sub;
import com.kh.lahol.store.model.vo.storeA;
import com.kh.lahol.store.model.vo.storeQ;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao sDao;
	
	//게시글수 카운트 
	@Override
	public int selectListCount() { 
		return sDao.selectListCount();
	}

	@Override
	public List<Store> selectList(PageInfo pi) {
		 
		return sDao.selectList(pi);
	}
	
	//인기순
	@Override
	public List<Store> selectList2(PageInfo pi2) {
		return sDao.selectList2(pi2);
	}

 
	//검색 게시글 카운트
	@Override
	public int selectSearchCount(Search search) {
		return sDao.selectSearchCount(search);
	}
	
	//검색 게시글
	@Override
	public List<Store> searchList(Search search, PageInfo pi) {
		return sDao.searchList(search , pi);
	}

 
	@Override
	public Store selectStore(int PR_CODE, boolean falg) {
		
		 if(falg) sDao.updateReadCount(PR_CODE);
		 return sDao.selectStore(PR_CODE);
	}
	
	//스토어 관리 
	@Override
	public List<Store> myselectList(PageInfo pi, String id) {
		return sDao.myselectList(pi,id);
		 
	}
	//스토어 내가쓴 글 카운트 
	 
	@Override
	public int mySearchCount(String id ) {
		return sDao.mySearchCount(id );
	}
	
	//게시글작성
	 
	@Override
	public int insertStore(Store s ) { 
		return sDao.insertStore(s );
	}

	@Override
	public int deleteStore(int PR_CODE) {
		 return sDao.deleteStore(PR_CODE);
	}

	@Override
	public int updateStore(Store s) {
		return sDao.updateStore(s);
	}

	@Override
	public List<storeQ> QsearchList(Search sc, PageInfo pi) {
		return sDao.QsearchList(sc , pi);
	}
	
	//답변 등록
	@Override
	public int insertAnser(storeA s) { 
		return sDao.insertAnser(s);
	}

	//답변 리스트 
	 
	@Override
	public List<storeA> AsearchList(Search sc, PageInfo pi) {
		return sDao.AsearchList(sc,pi);
	}


 
	
	
	//질문 등록
	@Override
	public int insertQuestion(storeQ q) { 
		return sDao.insertQuestion(q);
	}

	@Override
	public List<Cafe> CafeCode(Search cd) {
		return sDao. CafeCode(cd);
	}

	@Override
	public int subscribe(Sub sb) {
		return sDao.subscribe(sb);
	}

 
	@Override
	public int PAYMENT(Payment py) {
		return sDao.PAYMENT(py);
	}

	@Override
	public int prpay(Prpay pa) { 
		return sDao.prpay(pa);
	}

	//질문수 카운트
	@Override
	public int selectQCount(Search sc) {
		return sDao.selectQCount(sc );
	}
	
	//답변 수 카운트
	@Override
	public int selectACount(Search sc) {
		return sDao.selectACount(sc );
	}

	@Override
	public int storepayInsert(Pr_pay_w py) {
		 return sDao.storepayInsert(py);
	}

	@Override
	public int paymnet(Payment pay) {
		return sDao.paymnet(pay);
	}

	@Override
	public int prpay2(Prpay pa) {
		return sDao.prpay2(pa);
	}

	@Override
	public int sh(Sh_status st) {
		return sDao.sh(st);
	}
	
	//리뷰리스트
	@Override
	public List<StoreReview2> ReviewList(Search sc, PageInfo pi) {
		return sDao.ReviewList(sc,pi);
	}

	@Override
	public int selectReviewCount(Search sc) {
		return sDao.selectReviewCount(sc );
	}

 

 

 


}
