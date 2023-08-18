package com.ons.study.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ons.study.service.QnAContentService;

import jakarta.servlet.http.HttpSession;

import com.ons.study.dto.QnAContentDTO;
import com.ons.study.dto.UserDTO;

@Controller
public class QnABoardController {
	
	private static final String HOME_ROUTE = "redirect:/qnaboard";
	private static final int POPULAR_TAG_LIMIT_NUMBER = 10;
	
	@Autowired
	QnAContentService qnaContentService;
	
	// 질문 게시판 목록 확인
	@GetMapping("/qnaboard")
	public String qnaBoard(Model model, 
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="tag", required=false) String popularTag,
			@RequestParam(value="query", required=false) String query,
			HttpSession session) {
		addUserInfoToModel(model, session);
		
		List<QnAContentDTO> qnaContent = null;
		long qnaContentCount = 0;
		if (popularTag != null && query == null) {
			qnaContent = qnaContentService.getQnaContentByTag(page, popularTag);
			qnaContentCount = qnaContentService.getQnaContentCountByTag(popularTag);
		} else if (popularTag == null && query != null) {
			qnaContent = qnaContentService.getQnaContentByKeyword(page, query);
			qnaContentCount = qnaContentService.getQnaContentCountByKeyword(query);
		} else {
			qnaContent = qnaContentService.getQnaContentByPage(page);
			qnaContentCount = qnaContentService.getQnaContentTotalCount();
		}
		model.addAttribute("qnaLists", qnaContent);
		model.addAttribute("qnaContentsTotalCount", qnaContentCount);
		model.addAttribute("popularTags", qnaContentService.getPopularTags(POPULAR_TAG_LIMIT_NUMBER));
		model.addAttribute("pageLimit", QnAContentService.PAGE_LIMIT);
		return "QnABoard";
	}
	
	// 질문 게시판 신규 질문 작성
	@GetMapping("/qnawrite")
	public String qnaWrite(Model model, HttpSession session) {
		addUserInfoToModel(model, session);
		if (session.getAttribute("user") != null) {
			return "QnABoardWrite";
		} else {
			return "redirect:/login";
		}
	}
	
	// 질문 게시판 질문 내용 수정
	@GetMapping("/qnamodify")
	public String qnaModify(Model model,
			@RequestParam(value="id", required=false) String id,
			HttpSession session) {
		UserDTO userDto = (UserDTO) session.getAttribute("user");
		long idLong = Long.parseLong(id);
		QnAContentDTO contentDto = qnaContentService.getQnaContentById(idLong);
		if (id == null || id.isEmpty()) {
			return HOME_ROUTE;
		} else if (userDto != null) {
			if (contentDto.getUserId() != userDto.getId()) {
				return HOME_ROUTE;
			}
			addUserInfoToModel(model, session);
			
        	model.addAttribute("qnaContent", qnaContentService.getQnaContentById(idLong));
        	model.addAttribute("tags", qnaContentService.getTagsByContentId(idLong));
			return "QnABoardWrite";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/qnapostview")
	public String qnaPostView(Model model,
			@RequestParam(value="id", required=false) String id,
			HttpSession session) {
		if (id == null || id.isEmpty()) {
			// 요청 파라미터가 입력되지 않았을 경우 질문 게시판으로 이동.
            return HOME_ROUTE;
        } else {
        	addUserInfoToModel(model, session);
        	long contentId = Long.parseLong(id);
        	model.addAttribute("qnaContent", qnaContentService.getQnaContentById(contentId));
        	model.addAttribute("tags", qnaContentService.getTagsByContentId(contentId));
        	model.addAttribute("comments", qnaContentService.getCommentsById(contentId));
        	// 요청 파라미터가 입력되었을 경우.
        	return "QnAPostView";        	
        }
	}
	
	private void addUserInfoToModel(Model model, HttpSession session) {
		// 사용자가 로그인하여 session에 사용작자 존재하는 경우 model에 사용자 정보를 추가한다.
		UserDTO user = (UserDTO) session.getAttribute("user");
		if (user != null) model.addAttribute("user", user);
	}
}
