package com.oracle.handler;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oracle.service.UserService;
import com.oracle.vo.User;

@Controller
@SessionAttributes(value="user")
public class UserHandler {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/login")
	public String login(User user,Map<String,Object> map){
		System.out.println("ssss");
		User u=this.userService.login(user);
		System.out.println("登录了吗？现在的情况是：              "+u);
		if(u==null){
			
			return "redirect:index.jsp";
		}else{		
			map.put("user", u);
			return "redirect:main.jsp";
		}
	}
	
	
	@RequestMapping("/user/{path}")
	public String path(@PathVariable("path") String path){
		return "user/"+path;
	}
	
	@RequestMapping("/user/update")
	public String save(User user,Map<String,Object> map){		
		this.userService.update(user);	
		return "user/showDetail";
	}
	
	
	@RequestMapping("/user/updatePassowrd")
	public String savePassword(User user,Map<String,Object> map){		
		this.userService.updatePassword(user);		
		return "user/showDetail";
	}
}
