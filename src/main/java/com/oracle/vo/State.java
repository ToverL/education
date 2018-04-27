package com.oracle.vo;

public class State {
	private int stateId;
	private String stateName;
	private String comment;
	
	public int getStateId() {
		return stateId;
	}
	
	
	public State() {
		super();
	}


	public State(int stateId) {
		super();
		this.stateId = stateId;
	}


	@Override
	public String toString() {
		return "State [stateId=" + stateId + ", stateName=" + stateName + ", comment=" + comment + "]";
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
}
