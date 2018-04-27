package com.oracle.dao;

import com.oracle.vo.Guide;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GuideDao {
	//  look at me。。。。。
	public void save(Guide g);
	
	public void update(Guide g);
	
	public void getEntityById(int guideId);
	
	public void delete(int guideId);
	
	public List<Guide> getAll();
	
	public List<Guide> getJobGuides();
	public List<Guide> getClassGuides();
	
	public Guide getJobGuideByClassId(int classId);
	
	public Guide getClassGuideByClassId(int classId);
}
