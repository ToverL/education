package com.oracle.dao;

import java.util.List;

import com.oracle.vo.StudentChange;
import com.oracle.vo.Teacher;
import org.springframework.stereotype.Repository;

@Repository
public interface TeacherDao {

	public void save(Teacher teacher);
	
	public List<Teacher> getAll();
	
	public Teacher getTeacherByClassId(int classId);
	
	public void changeStudentState(StudentChange change);
	
}
