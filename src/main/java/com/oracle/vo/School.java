package com.oracle.vo;

public class School {

	private int schoolId;
	private String name;
	private String comment;

	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public int getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	public School() {
		super();
	}
	@Override
	public String toString() {
		return "School [schoolId=" + schoolId + ", name=" + name + ", comment=" + comment + "]";
	}
	
	
	
}
