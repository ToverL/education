package com.oracle.vo;

import java.sql.Date;

public class JobSearch {
	
	Integer classId;
	Integer schoolId;
	Date startDate;
	Date endDate;

	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Integer getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "JobSearch [classId=" + classId + ", schoolId=" + schoolId + ", startDate=" + startDate + ", endDate="
				+ endDate + "]";
	}

	
}
