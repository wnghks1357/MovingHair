package com.moving.adm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.moving.common.CommandMap;
import com.moving.common.Constants;
import com.moving.controller.StringUtils;
@Controller
public class AdLoginController implements Constants{

	Logger log = Logger.getLogger(this.getClass());
	private final String HTML_PATH = "/html/";
	private final String ADMIN_PATH = "admin/";
	
	/**********************************************************
	 * 로그인, 로그아웃 페이지 요청
	 * @throws Exception 
	 **********************************************************/
	@RequestMapping(value = {"/ad-login.do"})
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
		System.out.println("/ad-login : "+uri.indexOf("/ad-login") );
		log.info("/ad-login : " + uri.indexOf("/ad-login") );
		mav.addObject("result", commandMap.get("result"));
		//CommonUtils.setAdmLog(dao, session, "로그아웃", MUNU_LOGOUT, commandMap.get("ip").toString());
		session.invalidate();
		mav.addObject("msg", "You've been logged out successfully.");
		System.out.println("uri : " + uri);
		
		if (uri.indexOf("/ad-login") > -1) {
			//mav.setViewName(ADMIN_PATH+"login");
			mav.addObject("mainContent", "login.jsp");
		}else {
			//mav.setViewName(HTML_PATH+"main");
			mav.addObject("mainContent", "main.jsp");
		}
		mav.setViewName("layout/admin/adLayout");
		//mav.setViewName("layout/admin/adLayout");
		mav.addObject("snstype","Z");
		// 아이피
		String getRemoteAddr_ip = request.getRemoteAddr();
		String prev_url = request.getHeader("referer");
		mav.addObject("getRemoteAddr_ip", getRemoteAddr_ip);
		mav.addObject("prev_url", prev_url);
		return mav;	
	}
	
	/**********************************************************
	 * 로그인 권한과 매치
	 * @throws Exception 
	 **********************************************************/
	@RequestMapping(value = {"/siteLogin.do"})
	public @ResponseBody Map<String, Object> siteLogin(CommandMap commandMap) throws Exception {
		//ModelAndView mv = new ModelAndView(C_HTML_PATH+"proc");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String result="FAILURE";
		
		//로그인 아이디 정보 확인
		//Map<String,Object> sms_num = service.selectLogin_cnt(commandMap.getMap());
		//System.out.println("pwd : "+commandMap.get("pwd").toString());
		// 패스워드를 md5로 변환
		String pw_md5 = StringUtils.StringToMd5(commandMap.get("pwd").toString());
		System.out.println("pw_md5 : "+pw_md5);
		// md5를 sha256으로 변환
		String pw256 = StringUtils.StringToSha256(pw_md5);
		
		//신규로 바뀌는 패스워드 암호화
		String pw = pw256;
		
		System.out.println("sha256>>" + pw256);
		//System.out.println("pwd_db>>" + sms_num.get("MB_PWD").toString());
		//System.out.println("pwd_sha256_db>>" + StringUtils.StringToSha256(sms_num.get("MB_PWD").toString()));
		
		String level = commandMap.get("mb_usertype").toString().trim();
		commandMap.put("userid", commandMap.get("userid").toString().trim());
		//commandMap.put("userhp", commandMap.get("userhp").toString().trim());
		
		System.out.println("level" + level);
		
		List<String> code_list = new ArrayList<String>();
		if(level.equals("normal")) {
			code_list.add("normal");
			code_list.add("company");
			
		}else if(level.equals("partner")){
			code_list.add(commandMap.get("mb_usertype").toString().trim());
		}
	
		commandMap.put("code_list", code_list);
		
		System.out.println("md5 mb_usertype : " + commandMap.get("code_list").toString());
		commandMap.put("mb_pwd", pw);
		//int exec = service.selectMemberInfoDetail(commandMap.getMap());
		
		//아이디 확인
		//int exec_id = service.selectMemberInfoDetail_Id(commandMap.getMap());
		
		//System.out.println("sms_num : " + sms_num.get("LOGIN_CNT").toString());
		
		int login_cnt = 0;
		/*if(sms_num !=null){
			// 로그인 오류 횟수
			login_cnt = Integer.parseInt(sms_num.get("LOGIN_CNT").toString());
		}*/
		//아이디 확인
		/*if(exec_id > 0){
			
			if(login_cnt > 4){
				result="FAILURE";
			}else{
				//아이디_패스워드 확인(로그인 성공)
				if(exec > 0) {
					//인증번호 확인
					//System.out.println("userid : "+commandMap.get("userid"));
					//System.out.println("userhp : "+commandMap.get("userhp"));
					//System.out.println("smsnumber : "+commandMap.get("smsnumber"));
					
					if("admin".equals(level)){//관리자만 인증을 받는다
						int numchk = service.selectSmsNumberCnt(commandMap.getMap());
						if(numchk > 0){
							// 로그인 오류 횟수 초기화
							service.updateLoginCnt_Reset(commandMap.getMap());
							memberservice.SmsIntDelete(commandMap.getMap());
							result = "SUCCESS";			
						}else{
							result = "NO_NUM";
						}
					}else{
						service.updateLoginCnt_Reset(commandMap.getMap());
						result = "SUCCESS";			
					}
					
				}else if(login_cnt < 5){
					login_cnt = login_cnt +1;
					commandMap.put("login_cnt", login_cnt);
					
					// 로그인 오류 횟수 업데이트
					service.updateLoginCnt(commandMap.getMap());
					
					result="FAILURE_PWD^^"+login_cnt;
				}
			}
		}else{
			result="FAILURE_ID";
		}*/
		resultMap.put("result", result);
		return resultMap;

	}
}
