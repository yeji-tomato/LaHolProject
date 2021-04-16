package com.kh.lahol.mypage.partner.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.member.model.vo.Member;
import com.kh.lahol.mypage.common.PageInfo;
import com.kh.lahol.mypage.partner.model.vo.Ad;
import com.kh.lahol.mypage.partner.model.vo.Payment;

@Repository
public class pMypageDaoImpl implements pMypageDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member selectMember(Member m, String query) {
		return sqlSession.selectOne(query, m);
	}

	@Override
	public int deleteMember(String id) {
		return sqlSession.update("mypageMapper.deleteMember", id);
	}

	@Override
	public int updateMember(Member m) {
		return sqlSession.update("mypageMapper.updateMember", m);
	}

	@Override
	public int insertAd(Ad ad) {
		return sqlSession.insert("mypageMapper.insertAd", ad);
	}

	@Override
	public int insertPayment(Payment pay) {
		return sqlSession.insert("mypageMapper.insertPayment", pay);
	}

	@Override
	public int adListCount(String id) {
		return sqlSession.selectOne("mypageMapper.adListCount", id);
	}

	@Override
	public List<Ad> selectAdList(String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypageMapper.selectAdList", id, rowBounds);
	}
}
