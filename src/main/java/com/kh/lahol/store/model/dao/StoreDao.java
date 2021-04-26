package com.kh.lahol.store.model.dao;

import java.util.List;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.mypage.normal.model.vo.StoreReview;
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

public interface StoreDao {

	public int selectListCount();
	
	public List<Store> selectList(PageInfo pi);
	
	public List<Store> selectList2(PageInfo pi2);
	
	  
	public List<Store> searchList(Search search, PageInfo pi);

	public int selectSearchCount(Search search);

	public Store selectStore(int PR_CODE);

	public int updateReadCount(int PR_CODE);

	public List<Store> myselectList(PageInfo pi, String id);

	public int mySearchCount(String id);

	public int insertStore(Store s );

	public int deleteStore(int PR_CODE);

	public int updateStore(Store s);

	public List<storeQ> QsearchList(Search sc, PageInfo pi);

	public int insertAnser(storeA s);

	public List<storeA> AsearchList(Search sc, PageInfo pi);

	public int insertQuestion(storeQ q);

	public List<Cafe> CafeCode(Search cd);

	public int subscribe(Sub sb);

	public int PAYMENT(Payment py);

	public int prpay(Prpay pa);

	public int selectQCount(Search sc);

	public int selectACount(Search sc);

	public int storepayInsert(Pr_pay_w py);

	public int paymnet(Payment pay);

	public int prpay2(Prpay pa);

	public int sh(Sh_status st);

	public List<StoreReview2> ReviewList(Search sc, PageInfo pi);

	public int selectReviewCount(Search sc);

	 
 
	 
	
}
