package com.ons.study.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ons.study.dto.ReviewContentDTO;
import com.ons.study.dto.UserDTO;
import com.ons.study.service.ReviewContentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {

	@Autowired
	@Qualifier("reviewContentServiceImpl")
	ReviewContentService boardService;

	// 1 전체 게시글 조회
	@RequestMapping("/reviewboard")
	public ModelAndView getTotalBoard(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		int totalBoardCnt = boardService.totalBoardCnt();

		int limitcount = 12;
		int limitindex = (page - 1) * limitcount;
		int[] limit = new int[2];
		limit[0] = limitindex;
		limit[1] = limitcount;
		List<ReviewContentDTO> totalPagingList = boardService.pagingBoard(limit);

		ModelAndView mv = new ModelAndView();
		mv.addObject("totalPagingList", totalPagingList);
		mv.addObject("totalBoardCnt", totalBoardCnt);
		mv.setViewName("ReviewBoardList");
		return mv;
	}

	// 검색한 게시글 조회
	@RequestMapping("/searchboard")
	public ModelAndView searchBoard(
			@RequestParam(value="item", required=false, defaultValue="제목")String item, 
			@RequestParam(value="searchword", required=false, defaultValue="인프런")String searchword, 
			@RequestParam(value="page", required=false, defaultValue="1")int page		
			) {

		// 검색 조건으로 검색한 게시글 리스트, 게시글수
		HashMap<String, Object> map = new HashMap<>();

		if (item.equals("제목")) {
			map.put("colname", "title");
		}
		if (item.equals("내용")) {
			map.put("colname", "contents");
		}
		if (item.equals("인강사이트명")) {
			map.put("colname", "lecture_sitename");
		}
		
		map.put("searchitem", item);
		map.put("colvalue", "%"+searchword+"%");
		map.put("limitindex",(page-1)*12 );
		map.put("limitcount",12);
		
		List<ReviewContentDTO> searchlist = boardService.searchBoard(map);
		int searchBoardCnt = boardService.searchBoardCnt(map);

		ModelAndView mv = new ModelAndView();
		mv.addObject("totalPagingList", searchlist);
		mv.addObject("searchmap", map);
		mv.addObject("totalBoardCnt", searchBoardCnt);
		mv.setViewName("ReviewSearchList");
		return mv;
	}

	// 2 게시글 작성 페이지 이동
	@GetMapping("/reviewboardwrite")
	public ModelAndView writeform(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session == null || session.getAttribute("user") == null) {
			mv.setViewName("redirect:/login"); 
			return mv;
		}
		
		 UserDTO userdto = (UserDTO)session.getAttribute("user");
		 mv.addObject("userdto", userdto); 
		 mv.setViewName("ReviewBoardWrite"); 
		 return mv;
		 
	}

	// 2-1 게시글 작성 + 전체 게시글 조회 페이지로 이동
	@PostMapping("/reviewboardwrite")
	public String writeBoard(ReviewContentDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session == null || session.getAttribute("user") == null) {
			return "redirect:/login";
		}
		boardService.writeBoard(dto);
		return "redirect:/reviewboard";
	}

	// 게시글 한개 조회
	@RequestMapping(value = "/reviewpostview", method = RequestMethod.GET)
	public ModelAndView getOneBoard(@RequestParam("id") int id, HttpServletRequest request) {
		//조회한 게시글 dto
		ReviewContentDTO onedto = boardService.getOneBoard(id);
		boardService.plusViewCount(id);

		//세션user, 게시글작성유저
		HttpSession session = request.getSession();
		UserDTO sessionUser = (UserDTO)session.getAttribute("user");
		int boardUserId = boardService.getUserIdByContentId(id);
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("onedto", onedto);
		mv.addObject("sessionUserId", sessionUser.getId());
		mv.addObject("boardUserId", boardUserId);
		
		mv.setViewName("ReviewPostView");
		return mv;
	}

	@RequestMapping("/deleteboard")
	public String deleteBoard(@RequestParam("id") int id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDTO sessionUser = (UserDTO)session.getAttribute("user");
		int boardUserId = boardService.getUserIdByContentId(id);
		
		if(session == null || session.getAttribute("user") == null ) {
			//세션 내용 지우기: session.removeAttribute("user");
			return "redirect:/login";
		}
		int row = boardService.deleteBoard(id);
		return "redirect:/reviewboard";
	}

	@GetMapping("/updateboard")
	public ModelAndView updateBoardForm(@RequestParam("id") int id, HttpServletRequest request) { // 수정폼으로 이동
		HttpSession session = request.getSession();
		UserDTO sessionUser = (UserDTO)session.getAttribute("user");
		int boardUserId = boardService.getUserIdByContentId(id);
		
		ModelAndView mv = new ModelAndView();
		
		if(session == null || session.getAttribute("user") == null ) {
			//세션 내용 지우기: session.removeAttribute("user");
			mv.setViewName("Login");
			return mv;
		}
		
		ReviewContentDTO dto = boardService.getOneBoard(id);
		mv.addObject("dto", dto);
		mv.addObject("id", id);

		mv.setViewName("ReviewBoardUpdate");
		return mv;
	}

	@PostMapping("/updateboard")
	public String updateBoard(ReviewContentDTO dto) { // 게시글 수정

		int row = boardService.updateBoard(dto);
		return "redirect:/reviewboard";

	}

	
	//파일 업로드
	
	
	//댓글 

}
