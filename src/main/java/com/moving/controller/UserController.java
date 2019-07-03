package com.moving.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;
import java.util.UUID;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.moving.service.UserService;
import com.moving.util.MailSenderUtil;
import com.moving.vo.DesignLoungeVO;
import com.moving.vo.PointVO;
import com.moving.vo.ReservVO;
import com.moving.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired private UserService userService;
	@Autowired private MailSenderUtil mainSenderUtil;
	
	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
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
	
	//약관 동의 페이지
	@RequestMapping("/mhCustomerJoinAgree.do")
	public ModelAndView mhCustomerJoinAgree() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/mhCustomerJoinAgree");
		
		return mav;
	}
	
	//약관 동의 페이지
	@RequestMapping("/mhDesignerJoinAgree.do")
	public ModelAndView mhDesignerJoinAgree() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/mhDesignerJoinAgree");
		
		return mav;
	}
	
	//고객 회원가입 페이지 이동
	@RequestMapping("/mhUserJoin.do")
	public ModelAndView mhUserJoin(UserVO userVO) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userVO", userVO);
		mav.setViewName("user/mhUserJoin");
		
		return mav;
	}
	
	//디자이너 회원가입 페이지 이동
	@RequestMapping("/mhDesignerJoin.do")
	public ModelAndView mhDesignerJoin(UserVO userVO) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userVO", userVO);
		mav.setViewName("user/mhDesignerJoin");
		
		return mav;
	}
	
	//아이디 중복 체크 ajax 요청
	@RequestMapping("/idJungbokCheck.do")
	@ResponseBody
	public String idJungbokCheck(UserVO userVo) {
		
		int count = userService.idJungbokCheck(userVo);
		
		return count+"";
	}
	
	//휴대폰 중복 체크 ajax 요청
	@RequestMapping("/phoneJungbokCheck.do")
	@ResponseBody
	public String phoneJungbokCheck(UserVO userVo) {
		
		int count = userService.phoneJungbokCheck(userVo);
		
		logger.info("phone jungbok check : " + count);
		
		return count+"";
	}
	
	/**
	 * TODO 협의 후 컬럼 추가 필요
	 * @description 필수 항목들을 체크하기 위한 requestParam 사용
	 * @param UserVO
	 * @return
	 */
	@RequestMapping(value="/joinProc.do", produces="text/plain;charset=UTF-8")
	public String joinProc(HttpSession session, @RequestParam String userId, @RequestParam String userPwd, @RequestParam String userName, UserVO userVo, DesignLoungeVO designLoungeVO) {
		
		int count = userService.joinProc(userVo);
		
		logger.debug("join proc result : " + count);
		
		int loungeResult =0;
		
		//회원정보 테이블 insert 성공 and user가 디자이너인 경우 디자이너의 선호지역 insert
		if(count > 0 && userVo.getUserType() == 'D') {
			
			loungeResult = userService.insertRegDesignLounge(designLoungeVO);
			logger.debug("insert RegDesign Lounge result : " + loungeResult);
		}
		
		if( count > 0 ) {
			//userNo를 session에 넣기 위한 select
			int userNo = userService.selectUserNo(userVo.getUserId());
			session.setAttribute("userId", userVo.getUserId());
			session.setAttribute("userNo", userNo);
		}
		
		// 사용자 유형(사용자, 디자이너)에 따라 페이지 이동
		String requestPage = "";
		
		// 사용자이고 회원가입 성공한 경우, 1000포인트 지급 후 페이지 이동
		if( userVo.getUserType() == 'U' && count != 0) {
			
			//포인트 지급
			int insertPointResult = userService.insertJoinPoint(userVo);
			logger.debug("insert Point Result : " + insertPointResult);
			
			requestPage=  "redirect:/customerMain.do";
		//디자이너이고 회원가입 성공한 경우
		}else if( userVo.getUserType() == 'D' && count != 0){
			requestPage =  "redirect:/designerMain.do";
		//사용자이고 회원가입 실패시 회원가입 페이지로 다시 복귀
		}else if( userVo.getUserType() == 'U' && count == 0 ) {
			requestPage =  "redirect:/mhUserJoin.do";
		//디자이너이고 회원가입 실패시 회원가입 페이지로 다시 복귀
		}else if( userVo.getUserType() == 'D' && count == 0 ) {
			requestPage =  "redirect:/mhDesignerJoin.do";
		}//TODO 관리자인 경우 추가 필요
		else {
			//전부 해당 안될 시 사용자 로그인 페이지로 이동
			requestPage =  "redirect:/customerLoginView.do";
		}
		
		
		return requestPage;
		
	}

	@RequestMapping("/loginProc.do")
	public String loginProc(UserVO userVo, HttpSession session, ModelMap map ) {
		
		UserVO userRvo = userService.loginProc(userVo);
		
		String requestPage ="";
		
		//로그인 정상 처리
		//아이디 패스워드 일치 and 계정 상태 활동 'A'
		if( userRvo != null && userRvo.getUserStatus() =='A') {
			
			//로그인 정상 처리시 session 저장
			session.setAttribute("userId", userRvo.getUserId());
			session.setAttribute("userNo", userRvo.getUserNo());
			
			//사용자 로그인 시간 업데이트
			userService.updateLoginDate(userRvo.getUserId());
			
			//사용자인 경우
			if(userRvo.getUserType() == 'U') {
				requestPage =  "redirect:/customerMain.do";
			//디자이너인 경우
			}else if(userRvo.getUserType() == 'D') {
				requestPage =  "redirect:/designerMain.do";
			}
		}else {
			
			map.addAttribute("loginFail",true);

			logger.info("로그인 실패");
			logger.debug("id : " + userVo.getUserId());
			//로그인 실패시 customerLoginView로 이동
			requestPage =  "user/customerLoginView";
		}
		
		return requestPage;
	}	
	
	@RequestMapping("/logoutProc.do")
	public String logoutProc(UserVO userVo, HttpSession session) {
		

		session.removeAttribute("userId");
		session.removeAttribute("userNo");
		session.invalidate();
		
		return "user/customerLoginView";
		
	}	
	
	@RequestMapping("/idpwSearch.do")
	public ModelAndView idpwSearch() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/idpwSearch");
		
		return mav;
	}
	
	@RequestMapping(value="/idSearchProc.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String idSearchProc(UserVO userVo) {
		
		String userId = userService.idSearchProc(userVo);
		
		return userId;
	}
	
	@RequestMapping(value = "/pwdSearchProc.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String pwdSearchProc(UserVO userVo) {
		
		String message = "";
		
		String userId = userService.pwdSearchProc(userVo);
	
		
		//회원정보 일치 시
		if(userId != null && !userId.equals("")) {
			
			String tempPwd = "";
			//임시 비밀번호 생성 
			for (int i = 0; i < 5; i++) { 
				tempPwd = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
				tempPwd = tempPwd.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
			}
			
			String tempPwdHash = "";
			//password sha512 Hashing
			try {
				
				MessageDigest digest = MessageDigest.getInstance("SHA-512");
				digest.reset();
				
				digest.update(tempPwd.getBytes("utf8"));
				
				tempPwdHash = String.format("%040x", new BigInteger(1, digest.digest()));
				//0~20자 까지만 입력
				tempPwdHash = tempPwdHash.substring(0,20);
				
			} catch (Exception e) {

				e.printStackTrace();
			}
			
			UserVO param = new UserVO();
			param.setUserId(userId);
			param.setUserPwd(tempPwdHash);
			
			//password 임시 패스워드로 변경
			int result = userService.updatePwd(param);
			
			//패스워드 변경 완료
			if(result > 0) {
				
				//사용자에게 임시 비밀번호 전송
				mainSenderUtil.send(userVo.getUserId(), tempPwd);
				
				message = "임시 비밀번호를 메일로 발송했습니다.";
			}else {
				message = "서버 처리 중 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.";
			}		
		}else {
			message = "일치하는 회원정보를 찾을 수 없습니다.";
		}
		return message;
	}
	
	//마이페이지
	@RequestMapping("/myPage.do")
	public ModelAndView myPage(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		String userId = "";
		
		if(session.getAttribute("userId") != null) {
			userId = (String)session.getAttribute("userId");	
		}		
		
		UserVO userInfo = userService.getUserInfo(userId);
		
		mav.addObject("userInfo", userInfo);
		mav.addObject("mainContent", "myPage.jsp");
		mav.setViewName("layout/layout");
		return mav;
	}	
	
	//마이포인트
	@RequestMapping("/myPointPage.do")
	public ModelAndView myPointPage(HttpSession session, PointVO pointVO) {

		ModelAndView mav = new ModelAndView();
		String userId = "";
		if(session.getAttribute("userId") != null) {
			userId = (String)session.getAttribute("userId");	
		}	
		
		mav.addObject("p", pointVO);
		mav.addObject("mainContent", "myPoint.jsp");
		mav.setViewName("layout/layout");
		
		return mav;
	}
	
	@RequestMapping("/myPointListAjax.do")
	public @ResponseBody ModelAndView myReservationListAjax(HttpSession session, PointVO pointVO) {
		ModelAndView mav = new ModelAndView("contents/myPointPart");
		
		int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
		
		pointVO.setUserNo(userNo);
		
		List<ReservVO> myPointList = userService.selectMyPointList(pointVO);
		pointVO.setTotal(userService.myPointListCnt(pointVO));
		
		logger.info("myPointList size : " + myPointList.size());

	
		mav.addObject("p", pointVO);
		mav.addObject("myPointList", myPointList);
		
		return mav;
	}
	
	//회원탈퇴 페이지
	@RequestMapping("/outMemberPage.do")
	public ModelAndView outMemberPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		String userId = "";
		
		if(session.getAttribute("userId") != null) {
			userId = (String)session.getAttribute("userId");	
		}

		
		mav.addObject("userId", userId);
		mav.addObject("mainContent", "outMember.jsp");
		mav.setViewName("layout/layout");
		return mav;
	}
	
	//회원탈퇴 페이지
	@RequestMapping("/outMemberProc.do")
	public String outMemberProc(UserVO userVO) {
		
		int outResult = userService.outMember(userVO);
		
		String requestPage = "";
		
		//정상 탈퇴시
		if(outResult > 0) {
			requestPage=  "redirect:/customerLoginView.do";
			
		//탈퇴 실패시
		}else {
			requestPage = "redirect:/outMemberPage.do";
		}
			
		return requestPage;
	}
	
	//마이페이지에서 정보 수정
	@RequestMapping("/userInfoUpdate.do")
	public String myInfoUpdate(UserVO userVo) {
		
		int cnt = userService.myInfoUpdate(userVo);
		
		logger.debug("update user info result : " + cnt);
		
		return "redirect:/myPage.do";
	}	
	
	
	//패스워드 일치 여부 체크
	@RequestMapping("/checkUserPwd.do")
	@ResponseBody
	public String checkUserPwd(UserVO userVo) {
		
		int count = userService.checkUserPwd(userVo);
		
		logger.info("password check result : " + count);
		
		return count+"";
	}
	
	@RequestMapping("/updateUserPwd.do")
	public String updateUserPwd(UserVO userVo) {
		
		int result = userService.updatePwd(userVo);
		logger.info("update user pwd result : " + result);
		return "redirect:/myPage.do";
	}
	
}
