package com.kh.lahol.admin.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		
		if(id != "admin") {
			// 테스트를 위해 조건 반대로 작성
			return true;
		} else {
			response.setContentType("text/html; charset=utf-8");
//			PrintWriter out = response.getWriter(); 
//			out.print("<script>alert('권한이 없습니다');</script>");
//			out.flush();
//			out.close();
			
			response.sendRedirect(request.getContextPath());
			return false;
		}

	}
	
	
}
