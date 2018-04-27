package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.TeacherDao;
import com.oracle.vo.Teacher;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	TeacherDao teacherDao;
	
	@Override
	@Transactional
	public void save(Teacher teacher) {
		teacherDao.save(teacher);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Teacher> getAll() {
		return teacherDao.getAll();
	}

	@Override
	@Transactional(readOnly=true)
	public Teacher getTeacherByClassId(int classId) {
		return teacherDao.getTeacherByClassId(classId);
	}

}
