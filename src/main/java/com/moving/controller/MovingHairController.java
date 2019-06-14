package com.moving.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.moving.service.MovingHairService;
import com.moving.service.UserService;
import com.moving.vo.EventVO;
import com.moving.vo.NoticeVO;
import com.moving.vo.PagingVO;
import com.moving.vo.ReservVO;
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
	public ModelAndView designerMain(HttpSession seesion) {
		
		ModelAndView mav = new ModelAndView();
		
		String designerId = seesion.getAttribute("userId").toString();
		
		//디자이너에게 예약 신청한 사람들 리스트
		List<ReservVO> reservList = movinghairService.selectReservList(designerId);
		
		mav.addObject("reservList", reservList);
		mav.addObject("mainContent", "designerMain.jsp");
		mav.setViewName("layout/layout");
		return mav;
	}
	
	@RequestMapping("/myReservation.do")
	public ModelAndView myReservation(HttpSession session, PagingVO paging) {
		ModelAndView mav = new ModelAndView();
		
		String userId = session.getAttribute("userId").toString();
		
		ReservVO reservVO = new ReservVO();
		reservVO.setUserId(userId);
		
		List<ReservVO> myReservList = movinghairService.selectMyReservList(reservVO);
		reservVO.setTotal(myReservList.size());
		
		logger.info("myReserList size : " + myReservList.size());
		
		mav.addObject("p", reservVO);
		mav.addObject("myReservList", myReservList);
		mav.addObject("mainContent", "myReservation.jsp");
		mav.setViewName("layout/layout");
		return mav;
	}
	
	@RequestMapping("/eventList.do")
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
		
		//TODO 조회수 증가
		//movinghairService.eventUpdateHitCnt(eventId);
		
		EventVO eventVo = movinghairService.eventDetail(eventId);
		
		logger.info("eventVo : " + eventVo.toString());
		
		
		mav.addObject("eventVo", eventVo);
		
		mav.addObject("mainContent", "eventDetail.jsp");
		
		mav.setViewName("layout/layout");
		
		return mav;
	}
	
	@RequestMapping("/csNotice.do")
	public ModelAndView csNotice(PagingVO paging) {
		
		ModelAndView mav = new ModelAndView();
		
		List<NoticeVO> list = movinghairService.noticeList(paging);
		paging.setTotal(movinghairService.noticeListCnt());
		
		mav.addObject("list", list);
		mav.addObject("p", paging);

		mav.addObject("mainContent", "csNotice.jsp");
		mav.setViewName("layout/layout");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/designerLoungeList.do")
	public Object designerLoungeList(String keyword) {
		List<String> designerList = movinghairService.designerLoungeList(keyword);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put("designerList", designerList);
		
		
		return resMap;
	}
	
	
	@RequestMapping(value="/getGugun", produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getGugun(@RequestParam Map params, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//구군 가져올 api 호출
		URL url = new URL("http://api.openapi.io/gvia/interfaceAPI_gvia.jsp?gungucd="+params.get("gungucd"));
		
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8;");
		con.setRequestProperty("x-waple-authorization", "MS0xMzY1NjY2MTAyNDk0LTA2MWE4ZDgyLTZhZmMtNGU5OS05YThkLTgyNmFmYzVlOTkzZQ==");
		
		int responseCode = con.getResponseCode();
		System.out.println("responseCOde : " + responseCode);
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		
		String inputLine;
		StringBuffer sb = new StringBuffer();
		
		while ((inputLine = in.readLine()) != null){
			sb.append(inputLine);
			System.out.println("input line : " + inputLine);
		}
		
		in.close();
		con.disconnect();

		logger.info("gugun : " + sb.toString());
		return sb.toString();
	}
	
	@RequestMapping("/reservPage.do")
	public ModelAndView reservPage(@RequestParam String designerId, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("designerId", designerId);
		mav.addObject("userId", session.getAttribute("userId"));

		mav.addObject("mainContent", "reservPage.jsp");
		mav.setViewName("layout/layout");
		
		return mav;
	}
	
	@RequestMapping("/reservProc.do")
	public String reservProc(ReservVO reservVo) {
		
		ModelAndView mav = new ModelAndView();
	
		logger.info("reservVo : " + reservVo.toString());
		
		String reservDateStr = reservVo.getReservDateStr();
		
		Timestamp t = Timestamp.valueOf(reservDateStr);

		reservVo.setReservDate(t);
		
		System.out.println("reserDateStr : " + reservVo.getReservDate());
		
		int i = movinghairService.insertReservInfo(reservVo);
		
		logger.info("insert result : "+ i);

		return "redirect:/myReservation.do";
	
	}
	
	//디자이너 스케쥴 상세 보기 팝업
	@RequestMapping("/desginerScPopup.do")
	public ModelAndView desginerScPopup(ReservVO reservVo) {
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("reservId : " + reservVo.getReservId());
		ReservVO ResultReservVo = movinghairService.selectReservDetail(reservVo.getReservId());
	
		String reservDateStr = ResultReservVo.getReservDate().toString();
		
		//예약 날짜만 따로 분리하기 위한 
		ResultReservVo.setReservDateStr(reservDateStr.substring(0, 10));
		//예약 시간만 따로 분리하기 위한	
		ResultReservVo.setReservTime(reservDateStr.substring(10, 16));
	
		
		mav.addObject("reservVo", ResultReservVo);
		mav.setViewName("user/desginerScPopup");
		return mav;
	
	}
}
