package com.kh.lahol.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.member.model.vo.Cafe;
import com.kh.lahol.member.model.vo.M_Partner;
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
		int result = sqlSession.insert("memberMapper.insertMember", m);
		
		if(result > 0) {
			int result1 = sqlSession.insert("memberMapper.insertnMember2", m);
			return result1;
		} else {
			return 0;
		}
		
	}

	@Override
	public Member selectMemberByNickname(String nickname) {
		return sqlSession.selectOne("memberMapper.selectMemberByNickname", nickname);
	}

	// MEMBER TABLE INSERT
	@Override
	public int insertpMember(M_Partner m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	// M_PARTNER TABLE INSERT
	@Override
	public int insertpMember2(M_Partner m) {
		return sqlSession.insert("memberMapper.insertpMember", m);
	}

	@Override
	public int insertCafe(Cafe c) {
		return sqlSession.insert("memberMapper.insertCafe", c);
	}

	@Override
	public Member idSearch(Member m) {
		return sqlSession.selectOne("memberMapper.idSearch", m);
	}

	@Override
	public Member pwdSearch(Member m) {
		return sqlSession.selectOne("memberMapper.pwdSearch", m);
	}

	@Override
	public int updatePwd(Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

}
