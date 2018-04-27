package com.oracle.service;

import java.util.List;

import com.oracle.vo.School;

public interface SchoolService {
	public List<School> getAll();
	
	public void save(School school);
}
