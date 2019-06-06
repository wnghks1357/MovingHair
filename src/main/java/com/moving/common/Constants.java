package com.moving.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public interface Constants {
	/******* 대메뉴 *********************************/
	public static String SYSTEM_KR ="시스템 관리";
	public static String MEMBER_KR ="회원관리";
	public static String GOODS_KR ="상품관리";
	public static String ORDER_KR ="주문관리";
	public static String STATISTICS_KR ="통계관리";
	public static String BOARD_KR ="게시판관리";
	
	
	/******* 소메뉴 *********************************/
	public static String MENU_B01 =" > 메인노출 관리";
	public static String MENU_B02 =" > 팝업 관리";
	public static String MENU_B03 =" > 관리자 관리";
	public static String MENU_B04 =" > 방문로그 관리";
	public static String MENU_B05 =" > 택배사 관리";
	public static String MENU_B06 =" > 배송/반품정보 관리";
	
	public static String MENU_C01A =" > 일반회원 관리";
	public static String MENU_C01B =" > 조합원 관리";
	public static String MENU_C02 =" > 입점업체 관리";
	public static String MENU_C03 =" > MD 관리";
	
	public static String SUBMENU_MEMO =" > 메모";
	public static String SUBMENU_ORD =" > 주문";
	public static String SUBMENU_RET =" > 반품";

	public static String MENU_D01 =" > 카테고리 관리";
	public static String MENU_D02 =" > 상품등록 관리";
	public static String MENU_D03 =" > 고시정보 관리";
	public static String MENU_D04 =" > 이벤트 관리";
	public static String MENU_D05 =" > MD 추천 관리";
	public static String MENU_D06 =" > 상품아이콘 관리";
	public static String MENU_D07 =" > 상품공지 관리";
	public static String MENU_D08 =" > 수수료 관리";
	public static String MENU_D10 =" > 쿠폰 및 혜택 비주얼 관리";
	
	public static String MENU_E01 =" > 주문현황";
	public static String MENU_E02 =" > 주문/배송 관리";
	public static String MENU_E03 =" > 교환/환불 관리";
	public static String MENU_E04 =" > 주문취소 관리";
	public static String MENU_E05 =" > 정산 관리";
	public static String MENU_E06 =" > 쿠폰 관리";
	public static String MENU_E07 =" > 프로모션코드 관리";
	public static String MENU_E08 =" > 관리자메모 관리";
	
	public static String MENU_F01 =" > 제품별통계";
	public static String MENU_F02 =" > 기간별 매출통계";
	public static String MENU_F03 =" > 결제수단별 통계";
	
	public static String MENU_G01 =" > 공지사항";
	public static String MENU_G02 =" > 상품후기관리";
	public static String MENU_G03 =" > 1:1문의관리";
	public static String MENU_G04 =" > 상품문의관리";
	public static String MENU_G05 =" > 제휴/입점문의관리";
	public static String MENU_G06 =" > FAQ 관리";
	

	public static String SUBMENU_G02 =" > 상품후기상세정보";

	
	/******* 작업종류 *********************************/
	public static String MUNU_LIST ="조회";
	public static String MUNU_VIEW ="상세보기";
	public static String MUNU_INSERT ="입력";
	public static String MUNU_UPDATE ="수정";
	public static String MUNU_DELETE ="삭제";
	

	public static String MUNU_FILE_DELETE ="삭제";
	
	public static String MUNU_LOGIN ="로그인";
	public static String MUNU_LOGOUT ="로그아웃";
	
	/******* 폴더종류 *********************************/
	
	public static String C_ADMIN_PATH = "/admin/";
	public static String C_ADMIN_MEMBER_PATH = "/admin/member/";
	public static String C_HTML_PATH = "/html/";
	public static String C_HTML_LOGIN_PATH = "/html/login/";
	public static String C_HTML_JOIN_PATH = "/html/join/";
	public static String C_HTML_MYPAGE_PATH = "/html/mypage/";

	public static String C_HTML_CCENTER_PATH = "/html/customerCenter/";
	public static String C_HTML_EVENT_PATH = "/html/event/";
	public static String C_HTML_GOODS_PATH = "/html/goods/";

	public static String RENEWAL_ROOT_PATH = "/renewal";

	public static String C_M_PATH = "/mobile/";
	public static String C_M_LOGIN_PATH = "/mobile/login/";
	public static String C_M_JOIN_PATH = "/mobile/join/";
	public static String C_M_EVENT_PATH = "/mobile/event/";
	public static String C_M_CCENTER_PATH = "/mobile/customerCenter/";
	public static String C_M_MYPAGE_PATH = "/mobile/mypage/";
	public static String C_M_MINISHOP_PATH = "/mobile/miniShop/";
	
	public static String C_M_GOODS_PATH = "/mobile/goods/";
	
	
	/******* 파일 업로드 경로 *********************************/
	
	// 로컬 경로(박경호 개발자분)
	//public static String HOME_DIR = "D:"+File.separator+"wiz"+File.separator+"seoulmilk"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator;
//	public static String HOME_DIR = "D:"+File.separator+"workspace"+File.separator+"seoulmilk"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator;

//	public static String HOME_DIR = "D:"+File.separator+"eclipse"+File.separator+"workspace"+File.separator+"seoulmilk"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator;
	public static String HOME_DIR = "D:"+File.separator+"eclipse"+File.separator+"workspace"+File.separator+"seoulmilk"+File.separator+"WebContent"+File.separator;

	//테스트서버 업로드경로
	//public static String HOME_DIR = "D:"+File.separator+"resin-pro-4.0.53"+File.separator+"webapps"+File.separator+"seoulmilk"+File.separator;
	
	//실서버 업로드
//	public static String HOME_DIR = "/DATA/tshopping/";
	
	//public static String HOME_DIR = "C:\\Users\\Public\\test-files\\";
	
	/******* 이니시스 경로 *********************************/
	// 로컬 경로(박경호 개발자분)
	//public static String INI_DIR = "D:"+File.separator+"wiz"+File.separator+"seoulmilk"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"INIpay50";
	
	// 로컬
	public static String INI_DIR = "D:"+File.separator+"project_renew"+File.separator+"seoulmilk"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"INIpay50";

	//테스트서버 결제경로
	//public static String INI_DIR = "D:"+File.separator+"resin-pro-4.0.53"+File.separator+"webapps"+File.separator+"seoulmilk"+File.separator+"resources"+File.separator+"INIpay50";
	
	//실서버 결제경로
	//public static String INI_DIR = "/DATA/tshopping/resources/INIpay50";
	
	SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss"); 
	Date currentTime = new Date ( ); 
	public static String TODAY = formatter.format ( currentTime ); 





	/******* 메일 *********************************/
	public static String C_FROMMAIL = "psj9959@seoulmilk.co.kr";
	public static String C_FROMNAME = "서울우유협동조합";
	
	
	/******* transaction *********************************/
	public static final String SYNC_LOOP = "LOOP";

	/******* 경로 *********************************/
//	public static String FILEDIR = "D:" + File.separator +"workspace" + File.separator +"seoulmilk" + File.separator +"src" + File.separator +"main" + File.separator +"webapp"+File.separator;
//	public static String FILEDIR = "D:"+File.separator+"workspace"+File.separator+"seoulmilk"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator;
	
	
	
		
}

