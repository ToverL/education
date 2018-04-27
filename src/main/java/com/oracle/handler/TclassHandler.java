package com.oracle.handler;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.service.StudentService;
import com.oracle.service.TclassService;
import com.oracle.util.PageInfo;
import com.oracle.util.Select;
import com.oracle.vo.Student;
import com.oracle.vo.Tclass;

@Controller
@RequestMapping("/class")
public class TclassHandler {

	@Autowired
	TclassService classService;
	
	@Autowired
	StudentService studentService;
	
	//创建一个班级
	@RequestMapping("/saveClass")
	public String save(Tclass c,Map<String,Object> map){
		classService.save(c);
		List<Tclass> list=classService.getAll();
		System.out.println(list.size());
		System.out.println(list);
		map.put("list", list);
		return "class/listClass";
	}
	
	
	//创建一个班级
	@RequestMapping("/endClass")
	public String endClass(Tclass c,Map<String,Object> map){
		classService.endClass(c);
		List<Tclass> list=classService.getAll();
		map.put("list", list);
		return "class/listClass";
	}
	
	
	
	//查询所有班级
	@RequestMapping("/getAll")
	public String getAll(Map<String,Object> map){
		List<Tclass> list=classService.getAll();
		System.out.println(list.size());
		map.put("list", list);
		return "class/listClass";
	}
	
	//访问jsp面面
	@RequestMapping("/{path}")
	public String path(@PathVariable("path") String path){
	//	System.out.println(classService+"---------path");
		return "class/"+path;
	}
	
	/**
	 * 获得活动班级的下拉列表 
	 * @return
	 */
	@RequestMapping(value="/getActiveClassforGson",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getActiveClassforGson(String classId){
		Select select=new Select();
		select.putAll(classService.getTclassByState(1), "classId", "className",classId);
		System.out.println(select.toString());
		return select.toString();
	}
	
	@RequestMapping("/getClassById")
	public String getClassById(int classId,Map<String,Object> map){
		map.put("c", classService.getClassById(classId));
		map.put("endDate", new Date());
		return "class/viewEndClass";
	}
	
	
	//显示班级的详细信息
	@RequestMapping("/viewClassDetailsById")
	public String viewClassDetailsById(int classId,Map<String,Object> map){		
		
		map.put("c", classService.getClassById(classId));
		Tclass tclass=new Tclass();
		tclass.setClassId(classId);
		//班级详细信息；
		Map<String,Object> detail=classService.selectClassStatus(tclass);
		map.put("detail", detail);	
		//班级变化的信息
		List<Map<String,Object>> list= classService.selectClassChanges(tclass);
		map.put("list", list);
		//班级就业统计信息
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("classId", classId);
	//	map.put("paramMap", paramMap);
		Map<String,Object> jobMap=this.studentService.getJobDetails(paramMap);
		map.put("jobMap", jobMap);
		
		return "class/viewClassDetail";
	}
	
	
	/**
	 * 获得活动班级的下拉列表 
	 * @return
	 */
	@RequestMapping(value="/getActiveClassforType",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getActiveClassforType(int typeId,Integer stateId){
		Select select=new Select();
		select.putAll(classService.getTclassByType(typeId), "classId", "className",Integer.toString(stateId));
		System.out.println(select.toString());
		return select.toString();
	}
	
	

	
	
	//查询所有班级
	@RequestMapping("/listStudentsByClassId")
	public String listStudentsByClassId(Map<String,Object> map,Integer classId){
		
		List<Student> list=studentService.getStudentByClassId(classId);
		System.out.println(list.size());
		
		map.put("list", list);
		return "class/listStudent";
	}
}
