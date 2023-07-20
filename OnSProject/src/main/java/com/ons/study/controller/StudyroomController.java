package com.ons.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ons.study.dto.UserDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudyroomController {
	
	@GetMapping("/studyroom")
	public String studyRoomMain(HttpSession session) {
		if (isLogin(session)) {
			return "studyroom";
		} else {
			return "redirect:/login";
		}
	}
	
	private boolean isLogin(HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		if (user != null) return true;
		return false;
	}
}
