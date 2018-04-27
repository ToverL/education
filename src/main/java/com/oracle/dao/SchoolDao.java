package com.oracle.dao;

import java.util.List;

import com.oracle.vo.School;
import org.springframework.stereotype.Repository;

@Repository
public interface SchoolDao {

	public List<School> getAll();
	
	public void save(School school);
}
