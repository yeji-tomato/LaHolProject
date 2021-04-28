package com.kh.lahol.admin.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.admin.model.vo.CafeList;
import com.kh.lahol.admin.model.vo.Profit;
import com.kh.lahol.admin.model.vo.Promotion;
import com.kh.lahol.admin.model.vo.Report_N;
import com.kh.lahol.admin.model.vo.Report_P;
import com.kh.lahol.member.model.vo.Coupon;
import com.kh.lahol.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectNormalList() {
		return sqlSession.selectList("adminMapper.selectNormalList");
	}

	@Override
	public List<Member> selectPartnerList() {
		return sqlSession.selectList("adminMapper.selectPartnerList");
	}
	
	@Override
	public List<Coupon> selectCouponByDate(String date){
		return sqlSession.selectList("adminMapper.selectCouponByDate",date);
	}

	@Override
	public List<Coupon> selectCouponByTerm(Map<String, Object> dates) {
		return sqlSession.selectList("adminMapper.selectCouponByTerm", dates);
	}

	@Override
	public List<Promotion> selectAdWaitingList() {
		return sqlSession.selectList("adminMapper.selectAdWaitingList");
	}

	@Override
	public List<Promotion> selectAdConfirmedList() {
		return sqlSession.selectList("adminMapper.selectAdConfirmedList");
	}

	@Override
	public List<CafeList> selectCafeList(String date) {
		return sqlSession.selectList("adminMapper.selectCafeList", date);
	}

	@Override
	public void updateAdConfirmed(String adCode) {
		sqlSession.update("adminMapper.updateAdConfirmed", adCode);
	}

	@Override
	public void updateAdRejected(Promotion p) {
		sqlSession.update("adminMapper.updateAdRejected", p);
	}

	@Override
	public List<Report_P> selectReportedPartnerList() {
		return sqlSession.selectList("adminMapper.selectReportedPartnerList");
	}

	@Override
	public List<Report_P> selectCompletedPartnerList() {
		return sqlSession.selectList("adminMapper.selectCompletedPartnerList");
	}

	@Override
	public List<Report_N> selectReportedUserList() {
		return sqlSession.selectList("adminMapper.selectReportedUserList");
	}

	@Override
	public List<Report_N> selectCompletedUserList() {
		return sqlSession.selectList("adminMapper.selectCompletedUserList");
	}

	@Override
	public void updatePartnerWarned(Report_P ap) {
		sqlSession.update("adminMapper.updatePartnerWarned", ap);
		
	}

	@Override
	public void updateReportStatus(Report_P ap) {
		sqlSession.update("adminMapper.updateReportStatus", ap);	}

	@Override
	public void updatePartnerReportInvalid(Report_P ap) {
		sqlSession.update("adminMapper.updatePartnerReportInvalid", ap);
	}

	@Override
	public List<CafeList> selectCafeListByTerm(Map<String, Object> dates) {
		return sqlSession.selectList("adminMapper.selectCafeListByTerm", dates);
	}

	@Override
	public void updateUserWarned(Report_N an) {
		sqlSession.update("adminMapper.updateUserWarned", an);
		
	}

	@Override
	public void updateUserReportStatus(Report_N an) {
		sqlSession.update("adminMapper.updateUserReportStatus", an);
	}

	@Override
	public void updateUserReportInvalid(Report_N an) {
		sqlSession.update("adminMapper.updateUserReportInvalid", an);
	}

	@Override
	public List<Profit> selectProfitByDate(String date) {
		return sqlSession.selectList("adminMapper.selectProfitByDate", date);
	}
	

}
