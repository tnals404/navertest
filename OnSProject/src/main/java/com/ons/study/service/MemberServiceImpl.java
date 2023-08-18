package com.ons.study.service;

import com.ons.study.dao.MemberDAO;
import com.ons.study.dto.MemberDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO dao;

	public MemberDTO oneMember(String id){
		return dao.oneMember(id);
	}


}

