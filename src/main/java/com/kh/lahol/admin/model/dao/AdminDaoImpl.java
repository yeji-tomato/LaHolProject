package com.kh.lahol.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectNormalList() {
		return sqlSession.selectList("adminMapper.selectNormalList");
	}

}
