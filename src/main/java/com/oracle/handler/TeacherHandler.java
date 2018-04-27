package com.oracle.handler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.service.GuideService;
import com.oracle.service.TclassService;
import com.oracle.service.TeacherService;
import com.oracle.util.Select;
import com.oracle.vo.Guide;
import com.oracle.vo.Tclass;
import com.oracle.vo.Teacher;

@Controller
@RequestMapping("/teacher")
public class TeacherHandler {

	@Autowired
	TeacherService teacherService;
	
	@RequestMapping("/saveTeacher")
	public String save(Teacher c,Map<String,Object> map){
		teacherService.save(c);
		List<Teacher> list=teacherService.getAll();
		map.put("list", list);
		return "class/listTeacher";
	}
	
	
	@RequestMapping("/{path}")
	public String path(@PathVariable("path") String path){
		System.out.println(teacherService+"---------path");
		return "teacher/"+path;
	}
	
	
	@RequestMapping("/getAllforGson")
	@ResponseBody
	public String getAllforGson(String teacherId){
		Select select=new Select();
		System.out.println("test");
		select.putAll(teacherService.getAll(), "teacherId", "name",teacherId);
		System.out.println(select.toString());
		return select.toString();
	}
	
	
	
	@RequestMapping(value="/getTeacherByClass",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getTeacherGuideByClass(int classId){
		Select select=new Select();
		Teacher g=teacherService.getTeacherByClassId(classId);
		select.put(String.valueOf(g.getTeacherId()), g.getName());
		return select.toString();
	}
	
	
	
	
	
}
