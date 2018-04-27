package com.oracle.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.oracle.util.PageInfo;
import com.oracle.vo.Student;
import com.oracle.vo.StudentChange;
import com.oracle.vo.Tclass;
import com.oracle.vo.User;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentDao {
	public void save(Student student);
	public List<Student> getAll();
	
	public Student getStudentById(@Param("studentId") Integer studentId);
	public void updateJob(Student student);
	
	public void changeStudent(StudentChange change);
	
	/**
	 * 更新学员的转班，休学，退学后的信息
	 * @param student
	 */
	public void changeStudentState(StudentChange change);
	
	public void changeStudentStateToMyself(StudentChange change);
	
	/**
	 * 班级的学生结课
	 * @param clazz
	 */
	public void insertClassStudentToEnd(Tclass clazz);
	
	
	public void insertClassStudentToBegin(Student student);
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStudentChanges(int stuId);
	
	
	public List<Student> getJobList(@Param("param") Map<String,Object> map,@Param("page") PageInfo info);
	
	public int getJobListCount(@Param("param") Map<String,Object> map,@Param("page") PageInfo info);
	
	public void updateStudentToEnd(Tclass tclass);
	
	public Map<String,Object> getJobDetails(@Param("param") Map<String,Object> map);
	
	public List<Student> getStudentsByMap(@Param("param") Map<String,Object> map,@Param("page") PageInfo info);
	
	
	public List<Student> getStudentByClassId(@Param("classId") Integer classId);
	
	public int getStudentsCountByMap(@Param("param") Map<String,Object> map,@Param("page") PageInfo info);
	
	public void importStudent(Student stu);
	
}
