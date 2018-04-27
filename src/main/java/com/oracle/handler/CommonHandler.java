package com.oracle.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.service.CommonService;
import com.oracle.util.Select;



@Controller
@RequestMapping("/common")
public class CommonHandler {


	@Autowired
	CommonService commonSerive;
	
	/**
	 * 获得通用的信息的下拉列表 
	 * @return
	 */
	@RequestMapping(value="/getStatesById",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getActiveClassforGson(int type,String stateId){
		Select select=new Select();
		select.putAll(commonSerive.getStatesById(type), "stateId", "stateName",stateId);
		
		System.out.println(stateId+"\t"+select.toString());
		return select.toString();
	}
}
