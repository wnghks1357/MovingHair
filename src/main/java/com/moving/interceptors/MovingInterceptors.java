package com.moving.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class MovingInterceptors extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(MovingInterceptors.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//세션 객체 생성
		HttpSession session = request.getSession();
		
		String requestUrl = request.getRequestURI().toString();
		logger.info("요청 url : " + requestUrl);
		
		//세션에 id가 null이면 로그인이 안된 상태
		if (session.getAttribute("userId") == null){
			
			logger.info("userId : " + session.getAttribute("userId"));
			
			logger.info("세션 없음 로그인 페이지로 이동");
			
			//로그인 페이지로 이동
			response.sendRedirect(request.getContextPath()+"/customerLoginView.do");
			//컨트롤러를 실행하지 않는다 요청페이지로 이동 안한다.
			return false;
		}else {

			logger.info("userId : " + session.getAttribute("userId"));
			//컨트롤러 실행(요청 페이지로 이동)
			logger.info("로그인 상태 확인, 요청 페이지로 이동");
			return true;
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
}
