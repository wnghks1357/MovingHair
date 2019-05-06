package com.moving.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.moving.service.MovingHairService;
import com.moving.service.UserService;
import com.moving.vo.EventVO;
import com.moving.vo.PagingVO;
import com.moving.vo.UserVO;

@Controller
public class MovingHairController {
	
	@Autowired private UserService userService;
	@Autowired private MovingHairService movinghairService;
	
	private static Logger logger = LoggerFactory.getLogger(MovingHairController.class);
	
	@RequestMapping("/home.do")
	public String home(HttpSession session) {
		
		String userId = "";
		
		if(session.getAttribute("userId") != null) {
			userId = (String)session.getAttribute("userId");	
		}		
		
		UserVO userVo = userService.getUserInfo(userId);
		
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
	
	@RequestMapping("/event.do")
	public ModelAndView event(PagingVO paging) {
		
		ModelAndView mav = new ModelAndView();

		logger.info("paging : " + paging);
		
		List<EventVO> list = movinghairService.eventList(paging);
		paging.setTotal(movinghairService.eventListCnt());
		
		mav.addObject("list", list);
		mav.addObject("p", paging);

		mav.addObject("mainContent", "eventPage.jsp");
		mav.setViewName("layout/layout");
		
		return mav;
	}
	
	@RequestMapping("/eventDetail.do")
	public ModelAndView eventDetail(int eventId) {
		
		ModelAndView mav = new ModelAndView();

		logger.info("eventId : " + eventId);
		
		EventVO eventVo = movinghairService.eventDetail(eventId);
		
		logger.info("eventVo : " + eventVo.toString());
		
		mav.addObject("eventVo", eventVo);

		mav.setViewName("contents/eventDetailPopup");
		
		return mav;
	}
}
