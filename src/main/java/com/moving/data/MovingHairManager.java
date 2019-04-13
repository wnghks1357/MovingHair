package com.moving.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.moving.vo.UserPVO;
import com.moving.vo.UserRVO;
import com.moving.vo.UserVO;


public class MovingHairManager {

	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/moving/data/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public static int idJungbokCheck(UserPVO userPvo) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		
		String userId = userPvo.getUserId();
		int count = session.selectOne("movingHair.idJungbokCheck", userId);
		
		return count;
	}

	public static int phoneJungbokCheck(UserPVO userPvo) {
		
		SqlSession session = factory.openSession();
		
		String userPhone = userPvo.getUserPhone();
		int count = session.selectOne("movingHair.phoneJungbokCheck", userPhone);
		
		return count;
	}

	//TODO 
	public static int joinProc(UserPVO userPvo) {
		SqlSession session = factory.openSession(true);
		
		
		int count = session.insert("movingHair.joinProc", userPvo);
		
		return count;
	}

	public static UserRVO loginProc(UserPVO userPvo) {
		SqlSession session = factory.openSession();
		
		UserRVO userRvo = session.selectOne("movingHair.loginProc", userPvo);
		
		return userRvo;
	}
}
