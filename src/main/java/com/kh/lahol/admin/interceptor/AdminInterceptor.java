package com.kh.lahol.admin.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.lahol.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
	if(member != null ) {
		if(member.getGrade().equals("1")) {	
			return true;
		} else {
			response.sendRedirect(request.getContextPath());
			return false;
		}
	} else {
		response.sendRedirect(request.getContextPath());
		return false;
	}
  }
}
