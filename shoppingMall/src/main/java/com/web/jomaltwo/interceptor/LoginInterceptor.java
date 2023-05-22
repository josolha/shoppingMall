package com.web.jomaltwo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Object dtoObj = session.getAttribute("loginDto");
	    String userType = (String) session.getAttribute("userType"); // "user" 또는 "admin"

	    String uri = request.getRequestURI();
	    
		//로그인 안한 경우
	    //로그인 안한 경우
	    if(dtoObj == null) {
	        session.setAttribute("loginMsg", "This service requires login");
	        if (uri.contains("admin")) {
	            response.sendRedirect("/jomaltwo/admin/login.do");
	        } else if (uri.contains("user")) {
	            response.sendRedirect("/jomaltwo/user/login.do?moveUrl="+request.getRequestURL()+"?"+request.getQueryString());
	        }
	        return false;
	    } else {
	        if (uri.contains("admin") && !"admin".equals(userType)) {
	            // 관리자 페이지에 접근하려는데 userType이 admin이 아닐 경우
	            response.sendRedirect("/jomaltwo/admin/login.do");
	            return false;
	        } 
	    }
		
//			System.out.println("request.getQueryString()"+ request.getQueryString());
//			response.sendRedirect("adminLogin.do");
//			return false;
//		}
		
		return true;
	}
	
	

}
