package com.oracle.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class RightFilter
 */
public class RightFilter implements Filter {

	List<String> list=new ArrayList<String>();
	
	//过滤的前缀
	List<String> prefixList=new ArrayList<String>();
    /**
     * Default constructor. 
     */
    public RightFilter() {
        
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
	//	System.out.println(" servletName: "+req.getContextPath());
	//	System.out.println(" context:  "+req.getSession().getServletContext().getContextPath());
		
		String context=req.getContextPath();
		HttpSession session=req.getSession();
		
		
		String uri=req.getRequestURI();
		uri=uri.replaceFirst(context, "");
		
		String url=req.getRequestURL().toString();
		
//		System.out.println("uri:                   "+uri);
//		System.out.println("url:                   "+url);
		
		if(list.contains(uri)||isPass(uri)){
			//放行；
			chain.doFilter(request, response);
		}else if(session.getAttribute("user")!=null){//session
			//已登录，放行
			chain.doFilter(request, response);
		}else{
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out=res.getWriter();
			out.println("<html><script>window.open('"+context+"/index.jsp','_top')</script></html>");
			out.close();
		}
		
		
	}
	
	private boolean isPass(String uri){
		for(String s:prefixList){
			if(uri.startsWith(s)){
				return true;
			}
		}
		return false;
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		list.add("/");
		list.add("/index.jsp");
		list.add("/login");	
		list.add("/favicon.ico");
		
		prefixList.add("/css/");
		prefixList.add("/js/");
		prefixList.add("/images/");
		
	}

}
