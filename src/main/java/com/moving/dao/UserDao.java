package com.moving.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.moving.data.MovingHairManager;
import com.moving.vo.UserVO;


@Repository
public class UserDao {

	public int idJungbokCheck(UserVO userVo) {
		
		return MovingHairManager.idJungbokCheck(userVo);
	}

	public int phoneJungbokCheck(UserVO userVo) {
		// TODO Auto-generated method stub
		return MovingHairManager.phoneJungbokCheck(userVo);
	}

	public int joinProc(UserVO userVo) {
		
		return MovingHairManager.joinProc(userVo);
	}

	public UserVO loginProc(UserVO userVo) {
		// TODO Auto-generated method stub
		return MovingHairManager.loginProc(userVo);
	}

	public String idSearchProc(UserVO userVo) {

		return MovingHairManager.idSearchProc(userVo);
	}

	public String pwdSearchProc(UserVO userVo) {
		return MovingHairManager.pwdSearchProc(userVo);
	}

	public int updatePwd(UserVO param) {

		return MovingHairManager.updatePwd(param);
	}


}