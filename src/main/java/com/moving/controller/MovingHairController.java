package com.moving.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MovingHairController {
	
	
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
}
