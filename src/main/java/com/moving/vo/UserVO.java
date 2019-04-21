package com.moving.vo;

import java.sql.Timestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserVO {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private char userType;
	private String userName;
	private String userPhone;
	private String userEmail;
	private char userStatus;
	private String userZip;
	private String userAddr1;
	private String userAddr2;
	private int userBirthday;
	private char userSex;
	private char receiveEmail;
	private char receiveSms;
	private char createdType;
	private char requiredAgree;
	private char secretAgree;
	private Timestamp createdDate;
	private Timestamp updateDate;
	private Timestamp outDate;
	private Timestamp loginDate;
	
	
	
}
