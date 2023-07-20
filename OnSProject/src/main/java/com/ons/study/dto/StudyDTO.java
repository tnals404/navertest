package com.ons.study.dto;

import org.springframework.stereotype.Component;

@Component
public class StudyDTO {
int id;
String name, recruit_period, start_date, end_date;
int total_member;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRecruit_period() {
	return recruit_period;
}
public void setRecruit_period(String recruit_period) {
	this.recruit_period = recruit_period;
}
public String getStart_date() {
	return start_date;
}
public void setStart_date(String start_date) {
	this.start_date = start_date;
}
public String getEnd_date() {
	return end_date;
}
public void setEnd_date(String end_date) {
	this.end_date = end_date;
}
public int getTotal_member() {
	return total_member;
}
public void setTotal_member(int total_member) {
	this.total_member = total_member;
}


}
