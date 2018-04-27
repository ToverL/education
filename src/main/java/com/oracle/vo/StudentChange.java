package com.oracle.vo;

import java.sql.Date;

public class StudentChange {
	int changeId;
	Tclass fromClass;
	Tclass toClass;
	Student student;
	State changeType;
	Date exeDate;
	String comment;
	
	
	public int getChangeId() {
		return changeId;
	}
	public void setChangeId(int changeId) {
		this.changeId = changeId;
	}
	public Tclass getFromClass() {
		return fromClass;
	}
	public void setFromClass(Tclass fromClass) {
		this.fromClass = fromClass;
	}
	public Tclass getToClass() {
		return toClass;
	}
	public void setToClass(Tclass toClass) {
		this.toClass = toClass;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public State getChangeType() {
		return changeType;
	}
	public void setChangeType(State changeType) {
		this.changeType = changeType;
	}
	public Date getExeDate() {
		return exeDate;
	}
	public void setExeDate(Date exeDate) {
		this.exeDate = exeDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "StudentChange [changeId=" + changeId + ", fromClass=" + fromClass + ", toClass=" + toClass
				+ ", student=" + student + ", changeType=" + changeType + ", exeDate=" + exeDate + ", comment="
				+ comment + "]";
	}
	
	
	
	
}
