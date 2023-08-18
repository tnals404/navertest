package com.ons.study.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ReviewContentDTO {
	private int id, user_id;
	private String title, contents;
	private String created_time, updated_time, lecture_rating, lecture_sitename;
	private int board_type, view_count;

	public String getLecture_rating() {
		return lecture_rating;
	}
	public void setLecture_rating(String lecture_rating) {
		this.lecture_rating = lecture_rating;
	}
	public String getLecture_sitename() {
		return lecture_sitename;
	}
	public void setLecture_sitename(String lecture_sitename) {
		this.lecture_sitename = lecture_sitename;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
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
	
	
}
