package com.kh.lahol.coffeeclass.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.coffeeclass.model.vo.CoffeeClass;
import com.kh.lahol.coffeeclass.model.vo.PageInfo;

@Repository
public class CoffeeClassDaoImpl implements CoffeeClassDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return sqlSession.selectOne("clMapper.selectListCount");
	}

	@Override
	public List<CoffeeClass> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("clMapper.selectList", null, rowBounds);
	}

	@Override
	public int insertClass(CoffeeClass cl) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CoffeeClass selectCoffeeClass(int clid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateClass(CoffeeClass cl) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteClass(int clid) {
		// TODO Auto-generated method stub
		return 0;
	}

}
