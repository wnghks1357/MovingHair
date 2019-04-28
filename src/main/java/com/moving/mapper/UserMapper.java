package com.moving.mapper;

import org.springframework.stereotype.Repository;

import com.moving.vo.UserVO;

@Repository
public interface UserMapper {

	public int idJungbokCheck(UserVO userVo);

	public int phoneJungbokCheck(UserVO userVo);

	public int joinProc(UserVO userVo);

	public UserVO loginProc(UserVO userVo);

	public String idSearchProc(UserVO userVo);

	public String pwdSearchProc(UserVO userVo);

	public int updatePwd(UserVO param);
	
	public UserVO getUserInfo(String userId);

}