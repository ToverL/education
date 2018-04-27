package com.oracle.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.StudentDao;
import com.oracle.util.PageInfo;
import com.oracle.vo.State;
import com.oracle.vo.Student;
import com.oracle.vo.StudentChange;
import com.oracle.vo.User;


@Service
public class StudentServiceImpl implements StudentService {

	Map<Integer,Integer> dictinary =new HashMap<Integer,Integer>();
	
	{
		dictinary.put(304, 10);
		dictinary.put(305, 6);
		dictinary.put(306, 2);
	}
	
	@Autowired
	private StudentDao stuDao;
	
	
	@Transactional
	@Override
	public void save(Student student) {
		stuDao.save(student);
		stuDao.insertClassStudentToBegin(student);
	}


	@Override
	@Transactional(readOnly=true)
	public List<Student> getAll() {
		return stuDao.getAll();
	}


	@Override
	@Transactional(readOnly=true)
	public Student getStudentById(Integer studentId) {
		return stuDao.getStudentById(studentId);
	}


	@Override
	@Transactional
	public void updateJob(Student student) {
		this.stuDao.updateJob(student);
	}


	@Override
	@Transactional
	public void changeStudent(StudentChange change) {
		//向表中插入学生的变动信息;
		this.stuDao.changeStudent(change);
		System.out.println("**********************************    "+change.getToClass());
		//更改状态信息
		if(change.getToClass()!=null){					
			this.stuDao.changeStudentState(change);
		}else{
			//退学，休学，结课
			change.setChangeType(new State(dictinary.get(change.getChangeType().getStateId())));
			System.out.println("+======================== "+change.getChangeType());
			this.stuDao.changeStudentStateToMyself(change);
		}

	}


	/**
	 * 根据学生ID查询所有学生的状态变化信息
	 */
	@SuppressWarnings("rawtypes")
	@Override
	@Transactional(readOnly=true)
	public List<Map> selectStudentChanges(int stuId) {		
		return this.stuDao.selectStudentChanges(stuId);
	}


	@Override
	@Transactional(readOnly=true)
	public List<Student> getJobList(Map<String, Object> map,PageInfo info) {
		
		info.setRecordCount(stuDao.getJobListCount(map, info));
		
		List<Student> list=stuDao.getJobList(map, info);
		
		return list;
	}


	@Override
	@Transactional(readOnly=true)
	public Map<String, Object> getJobDetails(Map<String, Object> map) {
		return this.stuDao.getJobDetails(map);
	}


	@Override
	@Transactional(readOnly=true)
	public List<Student> getStudentsByMap(Map<String, Object> map,PageInfo info) {		
		//获得总人数；
		info.setRecordCount(stuDao.getStudentsCountByMap(map, info));
		List<Student> list=this.stuDao.getStudentsByMap(map,info);
		info.setList(list);
		return list;
	}


	@Override
	public void importStudent(Student stu) {
		this.stuDao.importStudent(stu);
		stuDao.insertClassStudentToBegin(stu);
	}



	@Override
	@Transactional(readOnly=true)
	public List<Student> getStudentByClassId(Integer classId) {
		// TODO Auto-generated method stub
		return stuDao.getStudentByClassId(classId);
	}




}
