package com.moving.controller;

import java.io.BufferedReader;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Clob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TimeZone;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.web.servlet.ModelAndView;

import com.moving.common.CommandMap;

public class StringUtils {
	
	/*
	 * Clob 를 String 으로 변경
	 */
	public static String clobToString(Clob clob) throws Exception {
		if(clob==null) {
			return "";
		}
		StringBuffer strOut = new StringBuffer();
		
		String str = "";
		
		BufferedReader br = new BufferedReader(clob.getCharacterStream());
		int i=0;
		while ((str = br.readLine()) != null) {

			if(i==0) {strOut.append(str);}
			else {strOut.append("<br>"+str);}
			i++;
			
		}
		return strOut.toString();
	}
	
	/*
	 * 배열을 comma로 
	 */
	public static String arrayToComma(String[] val) {
		String result="";
		if(val.length > 0) {
			result=StringUtils.myJoin(",", val);
		}
		return result.toString();
	}
	
	/*
	 * String을 md5로
	 */
	public static String StringToMd5(String pw) throws NoSuchAlgorithmException {
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		String pwd = pw;
		md5.update(pwd.getBytes(), 0, pwd.length());
		return String.format("%032x", new BigInteger(1, md5.digest()));
	}
	
	/*
	 * String을 sha256로
	 */
	public static String StringToSha256(String pw) throws NoSuchAlgorithmException {
		MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
		String pwd = pw;
		sha256.update(pwd.getBytes()); 

		byte byteData[] = sha256.digest();

		StringBuffer sb = new StringBuffer(); 

		for(int i = 0 ; i < byteData.length ; i++){
			sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}
	
	/*
	 * map push : clob type to String으로 and br태그 replaceAll
	 */
	public static void clobPutReplaceBr(Map<String,Object> map, Set<String> set) throws Exception{
		Set<String> keySet = set;

		Iterator<String> keyIterator = keySet.iterator();
		while (keyIterator.hasNext()) {
			String key = keyIterator.next();
			if (map.containsKey(key)) {
				map.put(key, clobToString((Clob) map.get(key)).replaceAll("<br>", "\r\n"));
			}
		}
		
		keySet.clear();
		
	}
	
	/*
	 * map push : clob type to String
	 */
	public static void clobPutReplace(Map<String,Object> map, Set<String> set) throws Exception{
		Set<String> keySet = set;

		Iterator<String> keyIterator = keySet.iterator();
		while (keyIterator.hasNext()) {
			String key = keyIterator.next();
			if (map.containsKey(key)) {
				map.put(key, clobToString((Clob) map.get(key)));
			}
		}
		keySet.clear();
	}
	
	public static void mapPutsession(HttpSession session, CommandMap commandMap) {
		commandMap.put("_sess_idx", session.getAttribute("_sess_idx"));
		commandMap.put("_sess_userid", session.getAttribute("_sess_userid"));
		commandMap.put("_sess_userName", session.getAttribute("_sess_userName"));
		commandMap.put("_sess_level", session.getAttribute("_sess_level"));
		commandMap.put("_sess_snsType", session.getAttribute("_sess_snsType"));
		commandMap.put("_sess_authType", session.getAttribute("_sess_authType"));
	}
	
	public static String detectDevice(HttpServletRequest request) {        
        Device device = DeviceUtils.getCurrentDevice(request);        
        if (device == null) {
            return "device is null";
        }
        String deviceType = "unknown";
        if (device.isNormal()) {
            deviceType = "web";
        } else if (device.isMobile()) {
            deviceType = "mobile";
        } else if (device.isTablet()) {
            deviceType = "tablet";
        }
        return deviceType;
    }
	
	public static String randomPassword (int size){
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
			
		char[] chars = new char[]{
				'0','1','2','3','4','5','6','7','8','9'
				,'A','B','C','D','E','F','G','H','I','J'
				,'K','L','M','N','O','P','Q','R','S','T'
				,'U','V','W','X','Y','Z'
				,'a','b','c','d','e','f','g','h','i','j'
				,'k','l','m','n','o','p','q','r','s','t'
				,'u','v','w','x','y','z'};
				
		for (int i = 0; i < size; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}
	
	public static String StringToRequestArrayChkbox(String s, HttpServletRequest request) {

		String arrChk="";
		String[] arrVal = request.getParameterValues(s);

		if(arrVal != null) {
			if(arrVal.length > 0) {
				arrChk = StringUtils.myJoin(",", arrVal);
			}
		}

		return arrChk;
	}
	
	public static String StringToRequestArrayChkbox2(String s, HttpServletRequest request) {

		String arrChk="";
		String[] arrVal = request.getParameterValues(s);

		if(arrVal != null) {
			if(arrVal.length > 0) {
				arrChk = StringUtils.myJoin("!", arrVal);
			}
		}

		return arrChk;
	}
	
	public static String myJoin(CharSequence delimeter, CharSequence... elements) {
		StringBuilder resultBuilder = new StringBuilder();
		if (elements.length > 0) {
			int i = 0;
			int e = elements.length-1;
			for (; i<e; i++) {
				resultBuilder.append(elements[i]);
				if(i != e ) {
					resultBuilder.append(delimeter);
				}
				
			}
			resultBuilder.append(elements[i]);
		}
		System.out.println("resultBuilder.toString()" + resultBuilder.toString());
		
		return resultBuilder.toString();
	}
	
	public static String coverWith(String input, String delimeter) {
		return new StringBuilder(delimeter).append(input).append(delimeter).toString();
	}
	
	/*
	 * paginationInfo 포함된  map push : clob type to String
	 */
	public static Map<String,Object> findResult(Map<String,Object> map) throws Exception{
		Iterator<Entry<String,Object>> iterator = map.entrySet().iterator();
		Entry<String,Object> entry = null;
		System.out.println("--------------------printMap--------------------\n");
		while(iterator.hasNext()){
			entry = iterator.next();

			if(map.containsKey("result")) {
				listClobToString((List<Map<String, Object>>) map.get("result"));
				return map;

			}
			System.out.println("key : "+entry.getKey()+",\tvalue : "+entry.getValue());
		}
		System.out.println("");
		System.out.println("------------------------------------------------\n");
		return map;
	}

	public static List<Map<String,Object>> listClobToString(List<Map<String,Object>> list) throws Exception{
		Iterator<Entry<String,Object>> iterator = null;
		Entry<String,Object> entry = null;
		System.out.println("--------------------printList--------------------\n");
		int listSize = list.size();
		System.out.println("size" + listSize);
		for(int i=0; i<listSize; i++){

			iterator = list.get(i).entrySet().iterator();

			while(iterator.hasNext()){
				entry = iterator.next();


				if(entry.getKey().equals("BRD_CONTENT") || entry.getKey().equals("BRD_RE_CONTENT")) {

					String myString = entry.getValue().toString();
					entry.setValue(StringUtils.clobToString((Clob) entry.getValue()));
				}
			}
			System.out.println("\n");
		}
		System.out.println("------------------------------------------------\n");
		return list;
	}

	public static String strJoinStrDate (String date, String h, String m, String s) throws ParseException {

		if(h.equals("")) h="00";
		if(m.equals("")) m="00";
		if(s.equals("")) s="00";
		String strToDate = date+" "+h+":"+m+":"+s;

		return strToDate;

	}
	
	// 2017.11.25 wisdom search :: 공통 날짜
	public static ModelAndView dataFun(ModelAndView mv) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String cdate = formatter.format(new Date());
		mv.addObject("cdate", cdate);
		mv.addObject("today", cdate);
		
		Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
		
		c.add(Calendar.DATE, 7);
        String cweek = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.MONTH, 1);
        String cmonth1 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.MONTH, 3);
        String cmonth3 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.MONTH, 6); 
        String cmonth6 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
 
        c.add(Calendar.DATE,-7);
        String pweek = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.DATE, -15);
        String pweek15 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.MONTH,-1);
        String pmonth1 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.MONTH,-3);
        String pmonth3 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.YEAR, 1);
        String pmonth12 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.MONTH,-6); 
        String pmonth6 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        c.add(Calendar.YEAR, -1);
        String pyear12 = formatter.format(c.getTime());
        c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        
        
        mv.addObject("cweek", cweek);
        mv.addObject("pweek15", pweek15);
        mv.addObject("cmonth1", cmonth1);
        mv.addObject("cmonth3", cmonth3);
        mv.addObject("cmonth6", cmonth6);
        mv.addObject("pweek", pweek);
        mv.addObject("pmonth1", pmonth1);
        mv.addObject("pmonth3", pmonth3);
        mv.addObject("pmonth6", pmonth6);
        mv.addObject("pmonth12", pmonth12);
        mv.addObject("pyear12", pyear12);
		return mv;
	}
}
