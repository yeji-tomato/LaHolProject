package com.kh.lahol.cafe.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.cafe.bus.model.vo.Cafe;
import com.kh.lahol.cafe.bus.model.vo.Coffee;
import com.kh.lahol.cafe.bus.model.vo.PageInfo;
import com.kh.lahol.cafe.user.model.vo.CaReview;
import com.kh.lahol.cafe.user.model.vo.CafeQnA;
import com.kh.lahol.cafe.user.model.vo.CafeRes;
import com.kh.lahol.cafe.user.model.vo.CoffeeCart;
import com.kh.lahol.cafe.user.model.vo.CoffeeOrder;
import com.kh.lahol.cafe.user.model.vo.CoffeeRes;
import com.kh.lahol.common.model.vo.Report;
import com.kh.lahol.mypage.normal.model.vo.CafeReview;
import com.kh.lahol.store.model.vo.Search;

@Repository
public class CafeDaoImpl implements CafeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int hereInsertRes(CafeRes r) {
		return sqlSession.insert("cafeMapper.insertHereRes", r);
	}

	@Override
	public int togoInsertRes(CafeRes r) {
		return sqlSession.insert("cafeMapper.insertTogoRes", r);
	}

	@Override
	public List<Cafe> cafeMainList() {
		return sqlSession.selectList("cafeMapper.cafeMainList");
	}

	@Override
	public Cafe searchDetail(String caCode) {
		return sqlSession.selectOne("cafeMapper.searchCafeDetail", caCode);
	}

	@Override
	public List<Coffee> coffeeBeverage(String caCode) {
		return sqlSession.selectList("cafeMapper.coffeeBeverage", caCode);
	}

	@Override
	public CafeRes hereTogoInfo(String id) {
		return sqlSession.selectOne("cafeMapper.hereTogoInfo", id);
	}

	@Override
	public int coResInsert(CoffeeRes coRes) {
		return sqlSession.insert("cafeMapper.coResInsert", coRes);
	}


	@Override
	public List<CoffeeCart> coResBasket(CoffeeCart coCart) {
		return sqlSession.selectList("cafeMapper.coResBasket", coCart);
	}

	@Override
	public List<CoffeeCart> coffeeOrder(String caResNo) {
		return sqlSession.selectList("cafeMapper.coOrder", caResNo);
	}

	@Override
	public int cafeReport(Report rep) {
		return sqlSession.insert("cafeMapper.cafeReport", rep);
	}

	@Override
	public List<Cafe> cafeSearch(Search search) {
		return sqlSession.selectList("cafeMapper.cafeSearch", search);
	}

	@Override
	public int reviewCount(String caCode) {
		return sqlSession.selectOne("cafeMapper.reviewCount", caCode);
	}
	
	@Override
	public List<CaReview> selectReviewList(String caCode, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getCoffeeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getCoffeeLimit());
		return sqlSession.selectList("cafeMapper.selectReviewList", caCode, rowBounds);
	}

	@Override
	public int cafeQask(CafeQnA cq) {
		System.out.println("dao : "+ cq);
		return sqlSession.insert("cafeMapper.cafeQask", cq);
	}

	@Override
	public List<CafeQnA> selectQnAList(String caCode) {
		return sqlSession.selectList("cafeMapper.selectQnAList", caCode);
	}

	@Override
	public int cafeUserReport(Report rep) {
		return sqlSession.insert("cafeMapper.cafeUserReport", rep);
	}

}
