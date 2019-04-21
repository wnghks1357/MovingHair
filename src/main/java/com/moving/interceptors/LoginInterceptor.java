package com.moving.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//세션 객체 생성
		HttpSession session = request.getSession();
		
		String requestUrl = request.getRequestURI().toString();
		
		//spring 3.1에서는 exclude-mapping 대신 이렇게 처리해야 함. 3.2 이상부터 exclude-mapping 사용가능
		if(requestUrl.contains("/customerLoginView.do") || requestUrl.contains("/designerLoginView.do")) {
			return true;
		}
		if(requestUrl.contains("/mhUserJoin.do") || requestUrl.contains("/mhDesignerJoin.do")) {
			return true;
		}
		if(requestUrl.contains("/joinProc.do") ) {
			return true;
		}
		if(requestUrl.contains("/idJungbokCheck.do") || requestUrl.contains("/phoneJungbokCheck.do")) {
			return true;
		}
		if(requestUrl.contains("/idpwSearch.do") || requestUrl.contains("/idSearchProc.do")) {
			return true;
		}
		if(requestUrl.contains("/pwdSearchProc.do") || requestUrl.contains("/loginProc.do")) {
			return true;
		}
	
		//세션에 id가 null이면
		if (session.getAttribute("userId") == null){
			
			System.out.println(session.getAttribute("userId"));
			
			System.out.println("세션 없음 로그인 페이지로 이동");
			//로그인 페이지로 이동
			response.sendRedirect(request.getContextPath()+"/customerLoginView.do");
			//컨트롤러를 실행하지 않는다 요청페이지로 이동 안한다.
			return false;
		}else {
			
			System.out.println(session.getAttribute("userId"));
			//컨트롤러 실행(요청 페이지로 이동)
			System.out.println("세션 있음 요청 페이지로 이동");
			return true;
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
}
