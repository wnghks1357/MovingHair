package com.moving.adm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.moving.common.CommandMap;
import com.moving.common.Constants;
@Controller
public class AdLoginController implements Constants{

	Logger log = Logger.getLogger(this.getClass());
	private final String HTML_PATH = "/html/";
	private final String ADMIN_PATH = "/admin/";
	
	/**********************************************************
	 * 로그인, 로그아웃 페이지 요청
	 * @throws Exception 
	 **********************************************************/
	@RequestMapping(value = {"/ad-login"})
	public ModelAndView blogin(
			@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout, 
		HttpSession session, CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		
		String uri = request.getRequestURI();
		System.out.println(" Request URI \t: ee  " + request.getRequestURI());
		
		
		if (error != null) {
			mav.addObject("error", "Invalid username and password!");
		}
		
		session.setAttribute("cPlatform", "web");
		log.debug("/ad-login : " + uri.indexOf("/ad-login") );
		mav.addObject("result", commandMap.get("result"));
		if (uri.indexOf("/ad-login") > -1) {
			mav.setViewName(ADMIN_PATH+"login");
		}
		
		if (logout != null) {
			
			//CommonUtils.setAdmLog(dao, session, "로그아웃", MUNU_LOGOUT, commandMap.get("ip").toString());
			session.invalidate();
			mav.addObject("msg", "You've been logged out successfully.");
			System.out.println("uri : " + uri);
			
			
			
			if (uri.indexOf("/ad-login") > -1) {
				//mav.setViewName(ADMIN_PATH+"login");
				mav.addObject("mainContent", ADMIN_PATH+"login");
			}else {
				//mav.setViewName(HTML_PATH+"main");
				mav.addObject("mainContent", HTML_PATH+"main");
			}
			mav.setViewName("layout/admin/adLayout");
		}
		mav.addObject("snstype","Z");
		// 아이피
		String getRemoteAddr_ip = request.getRemoteAddr();
		String prev_url = request.getHeader("referer");
		mav.addObject("getRemoteAddr_ip", getRemoteAddr_ip);
		mav.addObject("prev_url", prev_url);
		return mav;	
	}
}
