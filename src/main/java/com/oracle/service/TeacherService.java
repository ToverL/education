package com.oracle.service;

import java.util.List;

import com.oracle.vo.Teacher;

public interface TeacherService {

	public void save(Teacher teacher);
	
	public List<Teacher> getAll();
	
	public Teacher getTeacherByClassId(int classId);
}
