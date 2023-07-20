package com.ons.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ons.study.dto.UserDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	private static final String HOMEPAGE = "/recruitmentlist";
	
	@GetMapping("login")
	public String login(HttpSession session) {
		if (isLogin(session)) return "redirect:" + HOMEPAGE;
		return "Login";
	}
	
	@GetMapping("signup")
	public String signup(HttpSession session) {
		if (isLogin(session)) return "redirect:" + HOMEPAGE;
		return "SignUp";
	}
	
	@GetMapping("profile")
	public String profile(HttpSession session) {
		if (isLogin(session)) return "Profile";
		return "redirect:/login";
	}
	
	private boolean isLogin(HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		if (user != null) return true;
		return false;
	}
}
