package com.moving.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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

	public static int idJungbokCheck(UserVO userVo) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		
		String userId = userVo.getUserId();
		int count = session.selectOne("movingHair.idJungbokCheck", userId);
		
		return count;
	}

	public static int phoneJungbokCheck(UserVO userVo) {
		
		SqlSession session = factory.openSession();
		
		String userPhone = userVo.getUserPhone();
		int count = session.selectOne("movingHair.phoneJungbokCheck", userPhone);
		
		return count;
	}

	public static int joinProc(UserVO userVo) {
		SqlSession session = factory.openSession(true);
		
		
		int count = session.insert("movingHair.joinProc", userVo);
		
		return count;
	}

	public static UserVO loginProc(UserVO userVo) {
		SqlSession session = factory.openSession();
		
		UserVO userRvo = session.selectOne("movingHair.loginProc", userVo);
		
		return userRvo;
	}

	public static String idSearchProc(UserVO userVo) {
		SqlSession session = factory.openSession();
		
		
		return session.selectOne("movingHair.idSearchProc", userVo);
	}

	public static UserVO getUserInfo(String userId) {
		SqlSession session = factory.openSession();
		
		
		return session.selectOne("movingHair.getUserInfo", userId);
	}

	public static String pwdSearchProc(UserVO userVo) {
		SqlSession session = factory.openSession();
		return session.selectOne("movingHair.pwdSearchProc", userVo);
	}

	public static int updatePwd(UserVO param) {
		SqlSession session = factory.openSession(true);
		
		
		int count = session.insert("movingHair.updatePwd", param);
		
		return count;
	}
}
