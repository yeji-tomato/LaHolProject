package com.kh.lahol.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.admin.model.dao.AdminDao;
import com.kh.lahol.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<Member> selectNormalList() {
		
		return adminDao.selectNormalList();
	}
}
