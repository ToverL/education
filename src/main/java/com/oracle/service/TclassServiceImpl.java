package com.oracle.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.StudentDao;
import com.oracle.dao.TclassDao;
import com.oracle.vo.Tclass;

@Service
public class TclassServiceImpl implements TclassService {

	@Autowired
	TclassDao classDao;
	@Autowired
	StudentDao stuDao;
	
	
	@Override
	@Transactional
	public void save(Tclass c) {
		classDao.save(c);
	}

	/**
	 * 结课
	 */
	@Override
	@Transactional
	public void endClass(Tclass c) {
		//理新班级结课
		classDao.endClass(c);
		//结课日志
		this.stuDao.insertClassStudentToEnd(c);
		//更新学员的结课状态
		this.stuDao.updateStudentToEnd(c);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Tclass> getAll() {
		// TODO Auto-generated method stub
		return classDao.getAll();
	}

	@Override
	@Transactional(readOnly=true)
	public List<Tclass> getAll(String classType) {
		// TODO Auto-generated method stub
		return classDao.getAll(classType);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Tclass> getTclassByName(String className) {
		return classDao.getTclassByName(className);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Tclass> getTclassByState(int state) {
		return classDao.getTclassByState(1);
	}
	
	@Override
	@Transactional(readOnly=true)
	public Tclass getClassById(int classId){
		return classDao.getClassById(classId);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Tclass> getTclassByType(int typeId) {
		// TODO Auto-generated method stub
		return classDao.getTclassByType(typeId);
	}

	@Override
	@Transactional(readOnly=true)
	public Map<String, Object> selectClassStatus(Tclass c) {
		// TODO Auto-generated method stub
		return classDao.selectClassStatus(c);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Map<String,Object>> selectClassChanges(Tclass c) {

		return classDao.selectClassChanges(c);
	}

}
