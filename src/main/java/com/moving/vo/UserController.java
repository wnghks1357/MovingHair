package com.moving.vo;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	@RequestMapping("/customerLoginView.do")
	public ModelAndView customerMain() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/customerLoginView");
		
		return mav;
	}
	
	@RequestMapping("/designerLoginView.do")
	public ModelAndView designerMain() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/designerLoginView");
		
		return mav;
	}
	
	@RequestMapping("/mhUserJoin.do")
	public ModelAndView customerJoinView() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/mhUserJoin");
		
		return mav;
	}
	
	@RequestMapping("/mhDesignerJoin.do")
	public ModelAndView designerJoinView() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/mhDesignerJoin");
		
		return mav;
	}
	
}
