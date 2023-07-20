package com.ons.study.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ons.study.dto.MemberDTO;

@Mapper
@Repository
public interface MemberDAO {
	
	public MemberDTO oneMember(String id) ;


}