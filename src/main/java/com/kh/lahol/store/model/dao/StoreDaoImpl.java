package com.kh.lahol.store.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lahol.store.model.vo.PageInfo;
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
		int offset =(pi2.getCurrentPage() -1) *pi2.getStoreLimit(); 
		RowBounds rowBounds = new RowBounds(offset,pi2.getStoreLimit());
		return sqlSession.selectList("storeMapper.selectList2", null, rowBounds);
	}

	@Override
	public int insertStore(Store s) { 
		return 0;
	}

	@Override
	public int updateReadCount(int PR_CODE) { 
		return 0;
	}

	@Override
	public int selectStore(int PR_CODE) { 
		return 0;
	}

	@Override
	public int updateStore(Store s) { 
		return 0;
	}

	@Override
	public int deleteStore(int PR_CODE) { 
		return 0;
	}

	

}
