package com.oracle.vo;

public class Teacher {
	private int teacherId;
	private String name;
	private String teacherType; //java,ui,web,大数据
	private int state; //1.在职，2.离职
	private String comment;
	



	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeacherType() {
		return teacherType;
	}
	public void setTeacherType(String teacherType) {
		this.teacherType = teacherType;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Teacher [teacherId=" + teacherId + ", name=" + name + ", teacherType=" + teacherType + ", state="
				+ state + ", comment=" + comment + "]";
	}
	
	
}
