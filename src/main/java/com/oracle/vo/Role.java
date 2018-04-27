package com.oracle.vo;

public class Role {
	Integer roleNo;
	String roleName;
	String comment;
	public Integer getRoleNo() {
		return roleNo;
	}
	public void setRoleNo(Integer roleNo) {
		this.roleNo = roleNo;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "Role [roleNo=" + roleNo + ", roleName=" + roleName + ", comment=" + comment + "]";
	}

	
	
	
}
