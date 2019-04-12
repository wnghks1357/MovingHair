package com.moving.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.moving.dao.UserDao;
import com.moving.uservo.UserPVO;
import com.moving.uservo.UserRVO;

@Controller
public class UserController {
	
	@Autowired
	private UserDao dao;
	
	public void setDao(UserDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/customerLoginView.do")
	public ModelAndView customerLoginView() {
		ModelAndView mav = new ModelAndView();
		
		
		
		mav.setViewName("user/customerLoginView");
		
		return mav;
	}
	
	@RequestMapping("/designerLoginView.do")
	public ModelAndView designerLoginView() {
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
	public String idJungbokCheck(UserPVO userPvo) {
		
		int count = dao.idJungbokCheck(userPvo);
		
		return count+"";
	}
	
	@RequestMapping("/phoneJungbokCheck.do")
	@ResponseBody
	public String phoneJungbokCheck(UserPVO userPvo) {
		
		int count = dao.phoneJungbokCheck(userPvo);
		
		return count+"";
	}
	
	//TODO
	@RequestMapping(value="/joinProc.do", produces="text/plain;charset=UTF-8")
	public ModelAndView joinProc(UserPVO userPvo) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("userName : " + userPvo.getUserName());
		
		int count = dao.joinProc(userPvo);
		
		System.out.println(count);
		
		mav.setViewName("user/mhUserJoin");
		
		
		return mav;
	}

	@RequestMapping("/loginProc.do")
	public String loginProc(UserPVO userPvo, HttpSession session, HttpServletResponse response) {
		

		System.out.println(userPvo.getUserId());
		System.out.println(userPvo.getUserPwd());
		
		int count = dao.loginProc(userPvo);
		
		System.out.println("count : "+count);
		
		if(count != 0) {
			session.setAttribute("userId", userPvo.getUserId());
			System.out.println("로그인 성공");
			
			return "redirect:/customerMain.do";
		}else {
			System.out.println("로그인 실패");
			return "user/customerLoginView";
		}	
	}	
}
