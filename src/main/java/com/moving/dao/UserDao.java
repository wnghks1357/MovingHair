package com.moving.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.moving.data.MovingHairManager;
import com.moving.vo.UserPVO;
import com.moving.vo.UserRVO;
import com.moving.vo.UserVO;


@Repository
public class UserDao {

	public int idJungbokCheck(UserPVO userPvo) {
		
		return MovingHairManager.idJungbokCheck(userPvo);
	}

	public int phoneJungbokCheck(UserPVO userPvo) {
		// TODO Auto-generated method stub
		return MovingHairManager.phoneJungbokCheck(userPvo);
	}

	public int joinProc(UserPVO userPvo) {
		
		return MovingHairManager.joinProc(userPvo);
	}

	public UserRVO loginProc(UserPVO userPvo) {
		// TODO Auto-generated method stub
		return MovingHairManager.loginProc(userPvo);
	}

}