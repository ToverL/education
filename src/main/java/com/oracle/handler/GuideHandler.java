package com.oracle.handler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.service.GuideService;
import com.oracle.util.Select;
import com.oracle.vo.Guide;

@Controller
@RequestMapping("/guide")
public class GuideHandler {

	@Autowired
	GuideService guideService;
	
	@RequestMapping("/saveGuide")
	public String save(Guide guide,Map<String,Object> map){
		guideService.save(guide);
		List<Guide> list=guideService.getAll();
		System.out.println(list.size());
		System.out.println(list);
		map.put("list", list);
		return "guide/listGuide";
	}
	
	
	@RequestMapping("/{path}")
	public String path(@PathVariable("path") String path){
		System.out.println(guideService+"---------path");
		return "guide/"+path;
	}
	
	/**
	 * 获得所有的就业班主任，如果有班任id,id是默认被选中的状态
	 * @return
	 */
	@RequestMapping("/getJobGuidesforGson")
	@ResponseBody
	public String getJobGuidesforGson(String guideId){
		Select select=new Select();
		System.out.println("test");
		select.putAll(guideService.getJobGuides(), "guideId", "name",guideId);
		System.out.println(select.toString());
		return select.toString();
	}
	
	/**
	 * 获得所有的教务班主任，如果有班任id,id是默认被选中的状态
	 * @return
	 */
	@RequestMapping("/getClassGuidesforGson")
	@ResponseBody
	public String getClassGuidesforGson(String guideId){
		Select select=new Select();
		select.putAll(guideService.getClassGuides(), "guideId", "name",guideId);
		System.out.println(select.toString());
		return select.toString();
	}
	
	@RequestMapping("/getClassGuideByClass")
	@ResponseBody
	public String getClassGuideByClass(int classId){
		Select select=new Select();
		Guide g=guideService.getClassGuideByClassId(classId);
		select.put(String.valueOf(g.getGuideId()), g.getName());
		return select.toString();
	}
	
	
	@RequestMapping("/getJobGuideByClass")
	@ResponseBody
	public String getJobGuideByClass(int classId){
		Select select=new Select();
		Guide g=guideService.getJobGuideByClassId(classId);
		select.put(String.valueOf(g.getGuideId()), g.getName());
		return select.toString();
	}
}
