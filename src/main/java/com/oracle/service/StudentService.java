package com.oracle.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.oracle.util.PageInfo;
import com.oracle.vo.Student;
import com.oracle.vo.StudentChange;
import com.oracle.vo.User;

public interface StudentService {
	
	public void save(Student student);
	
	public List<Student> getAll();
	
	public Student getStudentById(Integer studentId);
	
	public void updateJob(Student student);
	
	public void changeStudent(StudentChange change);
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStudentChanges(int stuId);
	
	public List<Student> getJobList(Map<String,Object> map,PageInfo info);
	
	public Map<String,Object> getJobDetails(Map<String,Object> map);
	
	public List<Student> getStudentsByMap(Map<String,Object> map,PageInfo info);
	
	public void importStudent(Student stu);
	
	public List<Student> getStudentByClassId( Integer classId);
}
