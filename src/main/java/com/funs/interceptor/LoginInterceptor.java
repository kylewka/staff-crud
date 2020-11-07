package com.funs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	    // ��ȡSession
	    HttpSession session = request.getSession();
	    // ���Session���Ƿ��е�¼��Ϣ
	    if (session.getAttribute("LoginUser") == null) {
	        // û�е�¼��Ϣ���ض��򵽵�¼ҳ
	        response.sendRedirect(request.getContextPath()+"/login");
	        // ִ������
	        return false;
	    } 
	    // ����
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
