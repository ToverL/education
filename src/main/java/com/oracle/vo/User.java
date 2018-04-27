package com.oracle.vo;

public class User {
	Integer userNo;
	String userName;
	String password;
	String realName;
	Role role;
	String comment;
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userName=" + userName + ", password=" + password + ", realname=" + realName
				+ ", role=" + role + ", comment=" + comment + "]";
	}
	
}
