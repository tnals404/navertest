package com.ons.study.dto;

import org.springframework.stereotype.Component;

@Component
public class SkillDTO {
int id, study_group_id;
String name;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getStudy_group_id() {
	return study_group_id;
}
public void setStudy_group_id(int study_group_id) {
	this.study_group_id = study_group_id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}


}
