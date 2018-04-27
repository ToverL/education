package com.oracle.util;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PageInfo {
	int currentPage=1;  //当前页号
	int pageCount;  //总页数
	int pageSize=15;   //每页的记录数
	int recordCount;   //记录总数
	String action;    //url
	Map<String,Object> requestMap=new HashMap<String,Object>();
	
	public String getAction() {
		return action;
	}

	public Map<String, Object> getRequestMap() {
		return requestMap;
	}

	public void setRequestMap(Map<String, Object> requestMap) {
		this.requestMap = requestMap;
	}

	public void setAction(String action) {
		this.action = action;
	}



	List list=new ArrayList();  //结果

	
	
	public int getPageStart(){
		return (this.currentPage-1)*this.pageSize;
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageCount() {
		return this.recordCount%this.pageSize==0?this.recordCount/this.pageSize:this.recordCount/this.pageSize+1;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	
	
	public PageInfo(HttpServletRequest request) {
		String uri=request.getRequestURI();
//		System.out.println("uri:"+uri);
		//请求地址
		this.setAction(uri);
		
		String page=request.getParameter("currentPage");
		if(page!=null){
			this.currentPage=Integer.valueOf(page);
		}
		
		Enumeration<String> enu=request.getParameterNames();

		while(enu.hasMoreElements()){
			String str=enu.nextElement();
			if(!str.equals("currentPage")){
			//	System.out.println("++++++++++++++++++++++++++++++++"+str);
			//	System.out.println("================================="+request.getParameter(str));
				requestMap.put(str, request.getParameter(str));
			}
		}
		
		request.setAttribute("pageInfo", this);
	}

}
