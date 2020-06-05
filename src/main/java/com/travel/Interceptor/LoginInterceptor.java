package com.travel.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.travel.bean.UserInfo;


public class LoginInterceptor implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取请求的地址
		String url=request.getRequestURI();
		//对特殊地址直接放行
		/*//登录
		if(url.indexOf("login")>=0) {
			return true;
			
		} 
		//注册
		if(url.indexOf("register")>=0) {
			return true;
			
		} 
		//首页
		if(url.indexOf("/")>=0) {
			return true;
			
		} */
		//判断session，session存在登录后台
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
		if (userInfo!=null) {
			//身份存在，放行
			return true;
			
		}
		//执行到这里表示用户身份需要验证，跳转到登录页面
		request.getRequestDispatcher("/system/login").forward(request, response); 

		return false;
	}
	

}
