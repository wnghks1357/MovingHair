package com.moving.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.moving.dao.UserDao;
import com.moving.vo.UserVo;

@Controller
public class UserController {
	
	@Autowired
	private UserDao dao;
	
	public void setDao(UserDao dao) {
		this.dao = dao;
	}
	
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
	
	@RequestMapping("/idJungbokCheck.do")
	@ResponseBody
	public String idJungbokCheck(UserVo userVo) {
		
		int count = dao.idJungbokCheck(userVo);
		
		return count+"";
	}
	
	@RequestMapping("/phoneJungbokCheck.do")
	@ResponseBody
	public String phoneJungbokCheck(UserVo userVo) {
		
		int count = dao.phoneJungbokCheck(userVo);
		
		return count+"";
	}
	
	@RequestMapping("/joinProc.do")
	public ModelAndView joinProc(UserVo userVo) {
		ModelAndView mav = new ModelAndView();
		
		int count = dao.joinProc(userVo);
		
		
		return mav;
	}
	
	
}
