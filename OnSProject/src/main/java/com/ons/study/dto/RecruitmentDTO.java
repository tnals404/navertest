package com.ons.study.dto;

import org.springframework.stereotype.Component;

@Component
public class RecruitmentDTO {
	int id, user_id ;
	String title, contents;
	String created_time, updated_time;
	int board_type, like, view_count, study_group_id;
	StudyDTO study;
	SkillDTO skill;
	UserDTO user;
	CommentDTO comment;
	
	public CommentDTO getComment() {
		return comment;
	}
	public void setComment(CommentDTO comment) {
		this.comment = comment;
	}
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}
	public SkillDTO getSkill() {
		return skill;
	}
	public void setSkill(SkillDTO skill) {
		this.skill = skill;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCreated_time() {
		return created_time;
	}
	public void setCreated_time(String created_time) {
		this.created_time = created_time;
	}
	public String getUpdated_time() {
		return updated_time;
	}
	public void setUpdated_time(String updated_time) {
		this.updated_time = updated_time;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public StudyDTO getStudy() {
		return study;
	}
	public void setStudy(StudyDTO study) {
		this.study = study;
	}
	
	
	public int getStudy_group_id() {
		return study_group_id;
	}
	public void setStudy_group_id(int study_group_id) {
		this.study_group_id = study_group_id;
	}
	@Override
	public String toString() {
		return "RecruitmentDTO [id=" + id + ", user_id=" + user_id + ", title=" + title + ", contents=" + contents
				+ ", created_time=" + created_time + ", updated_time=" + updated_time + ", board_type=" + board_type
				+ ", like=" + like + ", view_count=" + view_count + ", study_group_id=" + study_group_id + ", study="
				+ study + ", skill=" + skill + ", user=" + user + ", comment=" + comment + "]";
	}
	
}
