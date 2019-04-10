package com.moving.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.moving.data.MovingHairManager;
import com.moving.vo.UserVo;


@Repository
public class UserDao {

	public int idJungbokCheck(UserVo userVo) {
		
		return MovingHairManager.idJungbokCheck(userVo);
	}

	public int phoneJungbokCheck(UserVo userVo) {
		// TODO Auto-generated method stub
		return MovingHairManager.phoneJungbokCheck(userVo);
	}

	public int joinProc(UserVo userVo) {
		
		return MovingHairManager.joinProc(userVo);
	}

}