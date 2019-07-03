package com.moving.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moving.mapper.UserMapper;
import com.moving.vo.DesignLoungeVO;
import com.moving.vo.PointVO;
import com.moving.vo.ReservVO;
import com.moving.vo.UserVO;


@Service
public class UserService {
	
	@Autowired private UserMapper userMapper;

	public int idJungbokCheck(UserVO userVo) {
		
		
		return userMapper.idJungbokCheck(userVo);
	}

	public int phoneJungbokCheck(UserVO userVo) {
		
		
		return userMapper.phoneJungbokCheck(userVo);
	}

	public int joinProc(UserVO userVo) {
		
		return userMapper.joinProc(userVo);
	}

	public UserVO loginProc(UserVO userVo) {
	
		
		return userMapper.loginProc(userVo);
		//return MovingHairManager.loginProc(userVo);
	}

	public String idSearchProc(UserVO userVo) {
		
		return userMapper.idSearchProc(userVo);
	}

	public String pwdSearchProc(UserVO userVo) {
		
		return userMapper.pwdSearchProc(userVo);
	}

	public int updatePwd(UserVO param) {
		
		return userMapper.updatePwd(param);
	}

	public UserVO getUserInfo(String userId) {
		
		return userMapper.getUserInfo(userId);
	}

	public int myInfoUpdate(UserVO userVo) {
		
		return userMapper.myInfoUpdate(userVo);
	}

	public int checkUserPwd(UserVO userVo) {
		
		return userMapper.checkUserPwd(userVo);
	}

	public int insertRegDesignLounge(DesignLoungeVO designLoungeVO) {
		
		return userMapper.insertRegDesignLounge(designLoungeVO);
		
	}

	public int updateLoginDate(String userId) {
		return userMapper.updateLoginDate(userId);
		
	}

	public int outMember(UserVO userVO) {
		return userMapper.outMember(userVO);
	}

	public List<ReservVO> selectMyPointList(PointVO pointVO) {
		return userMapper.selectMyPointList(pointVO);
	}

	public int myPointListCnt(PointVO pointVO) {
		return userMapper.myPointListCnt(pointVO);
	}

	public int insertJoinPoint(UserVO userVo) {
		return userMapper.insertJoinPoint(userVo);
	}

	public int selectUserNo(String userId) {
		return userMapper.selectUserNo(userId);
	}

}