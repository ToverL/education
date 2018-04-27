package com.oracle.service;

import java.util.List;
import java.util.Map;

import com.oracle.vo.Tclass;

public interface TclassService {
	public void save(Tclass c);
	
	public void endClass(Tclass c);
	
	public List<Tclass> getAll();
	
	public List<Tclass> getAll(String classType);
	
	public List<Tclass> getTclassByName(String className);
	
	public List<Tclass> getTclassByState(int state);
	
	public Tclass getClassById(int classId);
	
	public List<Tclass> getTclassByType(int typeId);
	
	public Map<String,Object> selectClassStatus(Tclass c);
	
	public List<Map<String,Object>> selectClassChanges(Tclass c);
}
