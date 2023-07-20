package com.ons.study.controller;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ons.study.dto.CommentDTO;
import com.ons.study.dto.RecruitmentDTO;
import com.ons.study.dto.SkillDTO;
import com.ons.study.dto.StudyDTO;
import com.ons.study.dto.UserDTO;
import com.ons.study.service.QnAContentService;
import com.ons.study.service.RecruitmentService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import jakarta.servlet.http.HttpSession;



@Controller
public class RecruitmentController {
	@Autowired
	@Qualifier("recruitmentServiceImpl")
	RecruitmentService service;
	
	@Autowired
	QnAContentService qnaContentService;
	
	@RequestMapping("/recruitmentlist")
	public ModelAndView recruitmentList(@RequestParam(value="name", required=false, defaultValue="") String name) {
		List<RecruitmentDTO> dto = service.recruitmentList(name);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardlist",dto);
		mv.setViewName("recruitment/boardlist");	
		return mv;
	}
	
	
	@RequestMapping("/recruit/recruitmentpostview")
	public ModelAndView recruitmentpostview(@RequestParam(value="id", required=false, defaultValue="1") int id, Model model, HttpSession session, @RequestParam(value="groupid", required=false, defaultValue="1") int groupid) {
		addUserInfoToModel(model, session);
		System.out.println(groupid);
		RecruitmentDTO dto = service.recruitmentpostview(id);
		RecruitmentDTO dto2 = service.recruitmentpostview2(id);
		RecruitmentDTO dto3 = service.recruitmentpostview3(id);
		service.updateViewCount(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("comments", qnaContentService.getCommentsById(id));
		mv.addObject("postviewlist",dto);
		mv.addObject("postviewlist2",dto2);
		mv.addObject("postviewlist3",dto3);
		mv.addObject("groupid",groupid);
		mv.setViewName("recruitment/postview");	
		return mv;
	}
	
	@RequestMapping("/recruit/boardwrite")
	public String boardwrite(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "recruitment/boardwrite";
		} else {
		return "redirect:/login";
		}
	}
	
	@PostMapping("/recruit/boardwrite")
	public String writeprocess(RecruitmentDTO dto) {
		service.insertContent(dto);
		return "redirect:/recruitmentlist";
	}
	
	
	@RequestMapping("/recruit/postviewedit")
	public ModelAndView postviewedit(@RequestParam(value="id", required=false, defaultValue="1") int id, @RequestParam(value="groupid", required=false, defaultValue="1") int groupid, HttpSession session) {
		RecruitmentDTO dto = service.recruitmentpostview(id);
		RecruitmentDTO dto2 = service.recruitmentpostview2(id);
		RecruitmentDTO dto3 = service.recruitmentpostview3(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("postviewlist",dto); //user
		mv.addObject("postviewlist2",dto2); //skill
		mv.addObject("postviewlist3",dto3); //study_group
		mv.addObject("groupid",groupid);
		mv.setViewName("recruitment/postviewedit");	
		return mv;
	}
	
	@PostMapping("/recruit/postviewedit")
	public String editprocess(RecruitmentDTO dto, HttpSession session) {
		System.out.println(dto.getStudy_group_id());
		StudyDTO study = new StudyDTO();
		study.setId(dto.getStudy_group_id());
		study.setEnd_date(dto.getStudy().getEnd_date());
		study.setName(dto.getStudy().getName());
		study.setRecruit_period(dto.getStudy().getRecruit_period());
		study.setStart_date(dto.getStudy().getStart_date());
		study.setTotal_member(dto.getStudy().getTotal_member());
		SkillDTO skill = new SkillDTO();
		skill.setStudy_group_id(dto.getStudy_group_id());
		skill.setName(dto.getSkill().getName());
		service.updateContent(dto);
		service.updateSkill(skill);
		service.updateStudy(study);
		return "redirect:/recruitmentlist";
	}
	
	@RequestMapping("/recruit/postviewdelete")
	public String postviewdelete( int groupid , int contentid) {
		service.deleteContent(contentid);
		service.deleteSkill(groupid);
		return "redirect:/recruitmentlist";
	}
	
	private void addUserInfoToModel(Model model, HttpSession session) {
		// 사용자가 로그인하여 session에 사용작자 존재하는 경우 model에 사용자 정보를 추가한다.
		UserDTO user = (UserDTO) session.getAttribute("user");
		if (user != null) model.addAttribute("user", user);
	}
}
