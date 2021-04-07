package com.kh.lahol.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return null;
	}

	@Override
	public Member selectMember(String userId) {
		Member m = sqlSession.selectOne("memberMapper.selectMemberById", userId);
		String query = "";
		
		if(m != null) {
			if(m.getGrade().equals("N")) {
				query = "memberMapper.selectNormalMember";
			} else if(m.getGrade().equals("P")) {
				query = "memberMapper.selectPartnerMember";
			} else {
				query = "memberMapper.selectMemberById";
			}
			return sqlSession.selectOne(query, userId);
		} else {
			return null;
		}
		
	}

	@Override
	public int insertnMember(Member m) {
		int result = sqlSession.insert("memberMapper.insertnMember", m);
		
		if(result > 0) {
			int result1 = sqlSession.insert("memberMapper.insertnMember2", m);
			return result1;
		} else {
			return 0;
		}
		
	}

}
