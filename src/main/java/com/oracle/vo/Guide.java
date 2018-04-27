package com.oracle.vo;

public class Guide {
	private Integer guideId; //班主任id
	private String name; //姓名
	private Integer type;   //类型  1为班任，2为就业班主任；
	private Integer state;  //1:在职，2.离职
	private String comment;
	public Integer getGuideId() {
		return guideId;
	}
	public void setGuideId(Integer guideId) {
		this.guideId = guideId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "Guide [guideId=" + guideId + ", name=" + name + ", type=" + type + ", state=" + state + ", comment="
				+ comment + "]";
	}
	
	
	
	
}
