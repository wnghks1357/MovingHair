package com.moving.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.moving.dao.UserDao;
import com.moving.uservo.UserPVO;
import com.moving.uservo.UserRVO;
import com.moving.uservo.UserVO;

@Controller
public class UserController {
	
	@Autowired private UserDao dao;
	//@Autowired private JavaMailSender mailSender;
	
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
	
	/**
	 * TODO 협의 후 컬럼 추가 필요
	 * @description 필수 항목들을 체크하기 위한 requestParam 사용
	 * @param userId
	 * @param userPwd
	 * @param userName
	 * @param userPvo
	 * @return
	 */
	@RequestMapping(value="/joinProc.do", produces="text/plain;charset=UTF-8")
	public String joinProc(HttpSession session, @RequestParam String userId, @RequestParam String userPwd, @RequestParam String userName, UserPVO userPvo) {
		ModelAndView mav = new ModelAndView();
		
		int count = dao.joinProc(userPvo);
		
		System.out.println(count);
		if( count != 0) {
			session.setAttribute("userId", userPvo.getUserId());
		}
		
		// 사용자 유형(사용자, 디자이너)에 따라 페이지 이동
		String requestPage = "";
		
		// 사용자이고 회원가입 성공한 경우
		if( userPvo.getUserType() == 'U' && count != 0) {
			requestPage=  "redirect:/customerMain.do";
		//디자이너이고 회원가입 성공한 경우
		}else if( userPvo.getUserType() == 'D' && count != 0){
			requestPage =  "redirect:/designerMain.do";
		//사용자이고 회원가입 실패시 회원가입 페이지로 다시 복귀
		}else if( userPvo.getUserType() == 'U' && count == 0 ) {
			requestPage =  "redirect:/mhUserJoin.do";
		//디자이너이고 회원가입 실패시 회원가입 페이지로 다시 복귀
		}else if( userPvo.getUserType() == 'D' && count == 0 ) {
			requestPage =  "redirect:/mhDesignerJoin.do";
		}//TODO 관리자인 경우 추가 필요
		else {
			//전부 해당 안될 시 사용자 로그인 페이지로 이동
			requestPage =  "redirect:/customerLoginView.do";
		}
		
		
		return requestPage;
		
	}

	@RequestMapping("/loginProc.do")
	public String loginProc(UserPVO userPvo, HttpSession session, HttpServletResponse response) {
		
		UserRVO userRvo = dao.loginProc(userPvo);
		
		String requestPage ="";
		
		//로그인 정상 처리
		if( userRvo != null ) {
			
			//로그인 정상 처리시 session 저장
			session.setAttribute("userId", userPvo.getUserId());
			
			
			//사용자인 경우
			if(userRvo.getUserType() == 'U') {
				requestPage =  "redirect:/customerMain.do";
			//디자이너인 경우
			}else if(userRvo.getUserType() == 'D') {
				requestPage =  "redirect:/designerMain.do";
			}
		}else {
			System.out.println("로그인 실패");
			//로그인 실패시 customerLoginView로 이동
			requestPage =  "user/customerLoginView";
		}
		
		return requestPage;
	}	
	
	@RequestMapping("/logoutProc.do")
	public String logoutProc(UserPVO userPvo, HttpSession session, HttpServletResponse response) {
		

		session.removeAttribute("userId");
		session.invalidate();
		
		return "user/customerLoginView";
		
	}	
	
	@RequestMapping("/idpwSearch.do")
	public ModelAndView idpwSearch() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/idpwSearch");
		
		return mav;
	}
	
	@RequestMapping("/idSearchProc.do")
	@ResponseBody
	public String idSearchProc(UserPVO userPvo) {
		
		String userId = dao.idSearchProc(userPvo);
		
		return userId;
	}
	
	@RequestMapping("/pwdSearchProc.do")
	@ResponseBody
	public String pwdSearchProc(UserPVO userPvo) {
		
//		try {
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
// 
//			messageHelper.setFrom("wnghks1357@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
//			messageHelper.setTo(userPvo.getUserId());     // 받는사람 이메일
//			messageHelper.setSubject("asd"); // 메일제목은 생략이 가능하다
//			messageHelper.setText();  // 메일 내용
// 
//			mailSender.send(message);
//			
//	    } catch(Exception e){
//	      System.out.println(e);
//	    }
		
		return null;
	}
}
