package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.GuideDao;
import com.oracle.vo.Guide;

@Service
public class GudeServiceImpl implements GuideService {

	@Autowired
	private GuideDao guideDao;
	
	
	@Override
	@Transactional
	public void save(Guide guide) {
		System.out.println(guideDao);
		this.guideDao.save(guide);
	}
	
	
	
	@Override
	@Transactional(readOnly=true)
	public List<Guide> getAll() {
		return guideDao.getAll();
	}



	@Override
	@Transactional(readOnly=true)
	public List<Guide> getJobGuides() {
		return guideDao.getJobGuides();
	}



	@Override
	@Transactional(readOnly=true)
	public List<Guide> getClassGuides() {
		// TODO Auto-generated method stub
		return guideDao.getClassGuides();
	}



	@Override
	@Transactional(readOnly=true)
	public Guide getJobGuideByClassId(int classId) {
		// TODO Auto-generated method stub
		return guideDao.getJobGuideByClassId(classId);
	}



	@Override
	@Transactional(readOnly=true)
	public Guide getClassGuideByClassId(int classId) {
		return guideDao.getClassGuideByClassId(classId);
	}

}
