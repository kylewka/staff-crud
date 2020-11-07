package com.funs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	    // 获取Session
	    HttpSession session = request.getSession();
	    // 检查Session中是否有登录信息
	    if (session.getAttribute("LoginUser") == null) {
	        // 没有登录信息，重定向到登录页
	        response.sendRedirect(request.getContextPath()+"/login");
	        // 执行拦截
	        return false;
	    } 
	    // 放行
	    return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
