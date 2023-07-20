package com.ons.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ons.study.dao.RecruitmentDAO;
import com.ons.study.dto.RecruitmentDTO;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {

	@Autowired
	RecruitmentDAO dao;

	
	@Override
	public List<RecruitmentDTO> recruitmentList(String name) {
		// TODO Auto-generated method stub
		return dao.recruitmentList(name);
	}

	@Override
	public RecruitmentDTO recruitmentpostview(int id) {
		// TODO Auto-generated method stub
		return dao.recruitmentpostview(id);
	}


	@Override
	public RecruitmentDTO recruitmentpostview2(int id) {
		// TODO Auto-generated method stub
		return dao.recruitmentpostview2(id);
	}

	@Override
	public RecruitmentDTO recruitmentpostview3(int id) {
		// TODO Auto-generated method stub
		return dao.recruitmentpostview3(id);
	}

	@Override
	public int insertContent(RecruitmentDTO dto) {
		// TODO Auto-generated method stub
		dao.insertStudyGroup(dto.getStudy());
		dao.insertSkill(dto);
		return dao.insertContent(dto);
	}

	@Override
	public int deleteContent(int id) {
		// TODO Auto-generated method stub
		return dao.deleteContent(id);
	}
	
	@Override
	public int deleteSkill(int id) {
		// TODO Auto-generated method stub
		dao.deleteStudyGroup(id);
		return dao.deleteSkill(id);
	}

	@Override
	public int updateContent(RecruitmentDTO dto) {
		return dao.updateContent(dto);
	}
	
	@Override
	public int updateSkill(RecruitmentDTO dto) {
		dao.updateStudy(dto);
		return dao.updateSkill(dto);
	}

	@Override
	public int updateViewCount(int id) {
		// TODO Auto-generated method stub
		return dao.updateViewCount(id);
	}
	

	

}
