package com.kh.lahol.mypage.normal.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.normal.model.vo.Coupon;

@Repository
public class nMypageDaoImpl implements nMypageDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int updateMember(Member m) {
		return sqlSession.update("mypageMapper.updateMember", m);
	}

	@Override
	public Member selectMember(Member m, String query) {
		return sqlSession.selectOne(query, m);
	}

	@Override
	public int deleteMember(String id) {
		return sqlSession.update("mypageMapper.deleteMember", id);
	}

	@Override
	public int selectCouponCount(String id) {
		return sqlSession.selectOne("mypageMapper.selectCouponCount", id);
	}

	@Override
	public List<Coupon> selectCouponList(String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypageMapper.selectCouponList", id, rowBounds);
	}

}
