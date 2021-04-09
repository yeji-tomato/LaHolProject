package com.kh.lahol.store.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.store.model.vo.PageInfo;
import com.kh.lahol.store.model.vo.Search;
import com.kh.lahol.store.model.vo.Store;

@Repository
public class StoreDaoImpl implements StoreDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public int selectListCount() { 
		return sqlSession.selectOne("storeMapper.selectListCount");
	}

	@Override
	public List<Store> selectList(PageInfo pi) { 
		int offset =(pi.getCurrentPage() -1) *pi.getStoreLimit(); 
		RowBounds rowBounds = new RowBounds(offset,pi.getStoreLimit());
		return sqlSession.selectList("storeMapper.selectList", null, rowBounds);
	}
	
	@Override
	public List<Store> selectList2(PageInfo pi2) { 
		return sqlSession.selectList("storeMapper.selectList2", null  );
	}

	 

	@Override
	public int selectSearchCount(Search search) {
		return sqlSession.selectOne("storeMapper.selectSearchCount",  search );
	}
  
	@Override
	public List<Store> searchList(Search search, PageInfo pi) {
		int offset =(pi.getCurrentPage() -1) *pi.getStoreLimit(); 
		RowBounds rowBounds = new RowBounds(offset,pi.getStoreLimit());
		return sqlSession.selectList("storeMapper.searchList",  search, rowBounds );
	}

	 

	@Override
	public Store selectStore(int PR_CODE) {
		return sqlSession.selectOne("storeMapper.selectStore", PR_CODE );
	}

	@Override
	public int updateReadCount(int PR_CODE) {
		return sqlSession.update("storeMapper.updateReadCount",PR_CODE );
		
	}

	
	

}
