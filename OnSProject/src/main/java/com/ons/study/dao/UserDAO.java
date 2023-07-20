package com.ons.study.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ons.study.dto.UserDTO;

@Mapper
@Repository
public interface UserDAO {
	public int isMember(String email, String password);
	public UserDTO getUserByEmailAndPassword(String email, String password);
	public int insertUser(UserDTO user);
}
