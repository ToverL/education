package com.oracle.vo;

import java.sql.Date;

public class Tclass {
	@Override
	public String toString() {
		return "Tclass [classId=" + classId + ", className=" + className + ", classType=" + classType + ", classGuide="
				+ classGuide + ", jobGuide=" + jobGuide + ", teacher=" + teacher + ", state=" + state + ", createdDate="
				+ createdDate + ", endDate=" + endDate + ", comment=" + comment + "]";
	}
	private Integer classId;
	private String className;
	private State classType;
	private Guide classGuide;
	private Guide jobGuide;
	private Teacher teacher;
	private State state;
	private Date createdDate;
	private Date endDate;
	private String comment;
	
	
	
	


	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public State getState() {
		return state;
	}
	public void setState(State state) {
		this.state = state;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	

	public Guide getClassGuide() {
		return classGuide;
	}
	public void setClassGuide(Guide classGuide) {
		this.classGuide = classGuide;
	}
	public Guide getJobGuide() {
		return jobGuide;
	}
	public void setJobGuide(Guide jobGuide) {
		this.jobGuide = jobGuide;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public String getClassName() {
		return className;
	}
	public State getClassType() {
		return classType;
	}
	public void setClassType(State classType) {
		this.classType = classType;
	}
	public void setClassName(String className) {
		this.className = className;
	}

	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}
