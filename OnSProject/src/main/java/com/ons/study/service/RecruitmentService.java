package com.ons.study.service;

import java.util.List;

import com.ons.study.dto.CommentDTO;
import com.ons.study.dto.RecruitmentDTO;


public interface RecruitmentService {
	public List<RecruitmentDTO> recruitmentList(String name);
	public RecruitmentDTO recruitmentpostview(int id);
	public RecruitmentDTO recruitmentpostview2(int id);
	public RecruitmentDTO recruitmentpostview3(int id);
	public int insertContent(RecruitmentDTO dto);
	public int deleteContent(int id);
	public int deleteSkill(int id);
	public int updateContent(RecruitmentDTO dto);
	public int updateSkill(RecruitmentDTO dto);
	public int updateViewCount(int id);
}
