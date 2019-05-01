package com.moving.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.moving.mapper.UserMapper;
import com.moving.vo.UserVO;


@Service
public class UserService {
	
	@Autowired SqlSession sqlSession;

	public int idJungbokCheck(UserVO userVo) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		
		return userMapper.idJungbokCheck(userVo);
	}

	public int phoneJungbokCheck(UserVO userVo) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		
		return userMapper.phoneJungbokCheck(userVo);
	}

	public int joinProc(UserVO userVo) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.joinProc(userVo);
	}

	public UserVO loginProc(UserVO userVo) {
	
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.loginProc(userVo);
		//return MovingHairManager.loginProc(userVo);
	}

	public String idSearchProc(UserVO userVo) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.idSearchProc(userVo);
	}

	public String pwdSearchProc(UserVO userVo) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.pwdSearchProc(userVo);
	}

	public int updatePwd(UserVO param) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.updatePwd(param);
	}

	public UserVO getUserInfo(String userId) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.getUserInfo(userId);
	}

	public int myInfoUpdate(UserVO userVo) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.myInfoUpdate(userVo);
	}

	public int checkUserPwd(UserVO userVo) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.checkUserPwd(userVo);
	}

}