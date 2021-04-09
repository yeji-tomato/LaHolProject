package com.kh.lahol.common.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	
	private Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);

	// preHandle : D.S.가 Controller 호출 전 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("====== START ======");
		logger.info("class: " + handler.getClass());
		logger.info(handler.toString());
		logger.info("Request URI : " + request.getRequestURI());
		logger.info("Servlet Path : " + request.getServletPath());
		
		Enumeration<String> paramNames = request.getParameterNames();
		
		while(paramNames.hasMoreElements()) {
			String key = (String)paramNames.nextElement();
			String value = request.getParameter(key);
			
			logger.info("Parameter : {} = {}", key, value);
		}
		
		logger.info("====== To Controller ======");
		
		return super.preHandle(request, response, handler);
		// 항상 true를 리턴 (true가 아니면 컨트롤러로 요청이 이어지지 않음)
	}
	
	
}
