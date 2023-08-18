package com.ons.study.service;

import java.util.List;

import com.ons.study.dto.CommentDTO;
import com.ons.study.dto.RecruitmentDTO;
import com.ons.study.dto.SkillDTO;
import com.ons.study.dto.StudyDTO;


public interface RecruitmentService {
	public List<RecruitmentDTO> recruitmentList(String name);
	public RecruitmentDTO recruitmentpostview(int id);
	public RecruitmentDTO recruitmentpostview2(int id);
	public RecruitmentDTO recruitmentpostview3(int id);
	public int insertContent(RecruitmentDTO dto);
	public int deleteContent(int id);
	public int deleteSkill(int id);
	public int updateContent(RecruitmentDTO dto);
	public int updateSkill(SkillDTO skill);
	public int updateStudy(StudyDTO study);
	public int updateViewCount(int id);
}
