package com.ons.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ons.study.dto.UserDTO;
import com.ons.study.service.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
public class UserRestController {
	
	@Autowired
	UserService userService;
	
	@PostMapping("/request-login")
	public ResponseEntity<UserDTO> requestLogin(@RequestBody UserDTO user, HttpSession session) {
	String email = user.getEmail();
	String password = user.getPassword();
		if (userService.isMember(email, password) == 1) {
			user = userService.getUserByEmailAndPassword(email, password);
			session.setAttribute("user", user);
			return ResponseEntity.ok().body(user);
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@GetMapping("/request-logout")
	public ResponseEntity<UserDTO> requestLogout(HttpSession session) {
		session.invalidate();
		return ResponseEntity.ok().body(new UserDTO());
	}
	
	@PostMapping("/request-signup")
	public ResponseEntity<Boolean> requestSignup(@RequestBody UserDTO user, HttpSession session) {
		UserDTO newUser = new UserDTO();
		newUser.setEmail(user.getEmail());
		newUser.setPassword(user.getPassword());
		newUser.setNickname(user.getNickname());
		boolean isSignedUp = false;
		if (userService.insertUser(newUser) > 0) {
			isSignedUp = true;
		}
		return ResponseEntity.ok().body(isSignedUp);
		
	}
	
}
