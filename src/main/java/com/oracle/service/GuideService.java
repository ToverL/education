package com.oracle.service;

import java.util.List;

import com.oracle.vo.Guide;

public interface GuideService {
	public void save(Guide guide);
	
	public List<Guide> getAll();
	public List<Guide> getJobGuides();
	public List<Guide> getClassGuides();
	
	public Guide getJobGuideByClassId(int classId);
	
	public Guide getClassGuideByClassId(int classId);
	
	
}
