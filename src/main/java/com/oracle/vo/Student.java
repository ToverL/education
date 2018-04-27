package com.oracle.vo;

import java.sql.Date;

public class Student {
	
	private int studentId;
	private String name;
	private Tclass tclass;
	private String sex;
	
	private Teacher teacher;
	private Guide classGuide;
	private Guide jobGuide;
	private State classState; //结课
	private School school;
	private State state;  //1.未毕业，2.已就业，3.延迟就业，4，考研，5.当兵，公务员；6，专升本，7.未就业，8.转行
	
	private String idcard;
	private State degree;
	private String major;
	private String grade;

	private String tel;
	private String mtel;
	private String ftel;
	private String address;
	private String intendCity;
	private String workcity;
	private String job;
	private String company;
	private Date worktime;
	private Date endClassTime;


	private String salary;
	private Integer salaryOfYear;
	private State recommendType;
	
	private String comment;
	
	

	public int getStudentId() {
		return studentId;
	}



	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public Tclass getTclass() {
		return tclass;
	}



	public void setTclass(Tclass tclass) {
		this.tclass = tclass;
	}



	public String getSex() {
		return sex;
	}



	public void setSex(String sex) {
		this.sex = sex;
	}



	public Teacher getTeacher() {
		return teacher;
	}



	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
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



	public State getClassState() {
		return classState;
	}



	public void setClassState(State classState) {
		this.classState = classState;
	}



	public School getSchool() {
		return school;
	}



	public void setSchool(School school) {
		this.school = school;
	}



	public State getState() {
		return state;
	}



	public void setState(State state) {
		this.state = state;
	}



	public String getIdcard() {
		return idcard;
	}



	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}



	public State getDegree() {
		return degree;
	}



	public void setDegree(State degree) {
		this.degree = degree;
	}



	public String getMajor() {
		return major;
	}



	public void setMajor(String major) {
		this.major = major;
	}



	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getMtel() {
		return mtel;
	}



	public void setMtel(String mtel) {
		this.mtel = mtel;
	}



	public String getFtel() {
		return ftel;
	}



	public void setFtel(String ftel) {
		this.ftel = ftel;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getIntendCity() {
		return intendCity;
	}



	public void setIntendCity(String intendCity) {
		this.intendCity = intendCity;
	}



	public String getWorkcity() {
		return workcity;
	}



	public void setWorkcity(String workcity) {
		this.workcity = workcity;
	}



	public String getJob() {
		return job;
	}



	public void setJob(String job) {
		this.job = job;
	}



	public String getCompany() {
		return company;
	}



	public void setCompany(String company) {
		this.company = company;
	}



	public Date getWorktime() {
		return worktime;
	}



	public void setWorktime(Date worktime) {
		this.worktime = worktime;
	}



	public Date getEndClassTime() {
		return endClassTime;
	}



	public void setEndClassTime(Date endClassTime) {
		this.endClassTime = endClassTime;
	}



	public String getSalary() {
		return salary;
	}



	public void setSalary(String salary) {
		this.salary = salary;
	}



	public Integer getSalaryOfYear() {
		return salaryOfYear;
	}



	public void setSalaryOfYear(Integer salaryOfYear) {
		this.salaryOfYear = salaryOfYear;
	}



	public State getRecommendType() {
		return recommendType;
	}



	public void setRecommendType(State recommendType) {
		this.recommendType = recommendType;
	}



	public String getComment() {
		return comment;
	}



	public void setComment(String comment) {
		this.comment = comment;
	}



	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", name=" + name + ", tclass=" + tclass + ", sex=" + sex
				+ ", teacher=" + teacher + ", classGuide=" + classGuide + ", jobGuide=" + jobGuide + ", classState="
				+ classState + ", school=" + school + ", state=" + state + ", idcard=" + idcard + ", degree=" + degree
				+ ", major=" + major + ", grade=" + grade + ", tel=" + tel + ", mtel=" + mtel + ", ftel=" + ftel
				+ ", address=" + address + ", intendCity=" + intendCity + ", workcity=" + workcity + ", job=" + job
				+ ", company=" + company + ", worktime=" + worktime + ", salary=" + salary + ", salaryOfYear="
				+ salaryOfYear + ", recommendedType=" + recommendType + ", comment=" + comment + "]";
	}



}
