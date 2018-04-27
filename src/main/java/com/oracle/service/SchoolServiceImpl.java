package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.SchoolDao;
import com.oracle.vo.School;


@Service
public class SchoolServiceImpl implements SchoolService {

	@Autowired
	SchoolDao schoolDao;
	
	
	@Override
	@Transactional(readOnly=true)
	public List<School> getAll() {
		
		return schoolDao.getAll();
	}


	@Override
	@Transactional
	public void save(School school) {
		this.schoolDao.save(school);
		
	}

}
