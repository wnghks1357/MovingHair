package com.moving.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.moving.dao.MovingHairDao;
import com.moving.dao.UserDao;
import com.moving.vo.UserVO;

@Controller
public class MovingHairController {
	
	@Autowired private MovingHairDao dao;
	
	public void setDao(MovingHairDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/home.do")
	public String home(HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		
		UserVO userVo = dao.getUserInfo(userId);
		
		// 사용자 유형(사용자, 디자이너)에 따라 페이지 이동
		String requestPage = "";
		
		if(userVo.getUserType() == 'U') {
			requestPage=  "redirect:/customerMain.do";
		}else {
			requestPage =  "redirect:/designerMain.do";
		}
		
		
		return requestPage;
	}
	
	
	@RequestMapping("/customerMain.do")
	public ModelAndView customerMain() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mainContent", "customerMain.jsp");
		mav.setViewName("layout/layout");
		return mav;
	}
	
	@RequestMapping("/designerMain.do")
	public ModelAndView designerMain() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("mainContent", "designerMain.jsp");
		mav.setViewName("layout/layout");
		return mav;
	}
	
	@RequestMapping("/myReservation.do")
	public ModelAndView myReservation() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mainContent", "myReservation.jsp");
		mav.setViewName("layout/layout");
		return mav;
	}
}
