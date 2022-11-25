package com.multi.multigg.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		if(request.getRequestURI().contains("/loginform.do") || 
				request.getRequestURI().contains("/ajaxlogin.do")|| 
				request.getSession().getAttribute("login") != null ||
				request.getRequestURI().contains("/test.do") ||
				request.getRequestURI().contains("/registerform.do")||
				request.getRequestURI().contains("/register.do")  ||
				request.getRequestURI().contains("/lol.do") ||
				request.getRequestURI().contains("/recode.do") ||
				request.getRequestURI().contains("/main.do")
				) {
				return true;
			}
			if(request.getSession().getAttribute("login") == null) {
				response.sendRedirect("loginform.do");
				return false;
			}
			
			return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
		
	}
}
