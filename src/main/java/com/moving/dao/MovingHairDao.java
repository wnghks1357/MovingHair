package com.moving.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moving.data.MovingHairManager;
import com.moving.vo.UserVO;


@Repository
public class MovingHairDao {

	public UserVO getUserInfo(String userId) {
		// TODO Auto-generated method stub
		return MovingHairManager.getUserInfo(userId);
	}

}