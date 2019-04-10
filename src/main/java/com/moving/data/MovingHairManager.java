package com.moving.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.moving.vo.UserVo;


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

	public static int idJungbokCheck(UserVo userVo) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		
		String userId = userVo.getUserId();
		int count = session.selectOne("movingHair.idJungbokCheck", userId);
		
		return count;
	}

	public static int phoneJungbokCheck(UserVo userVo) {
		
		SqlSession session = factory.openSession();
		
		String userPhone = userVo.getUserPhone();
		int count = session.selectOne("movingHair.phoneJungbokCheck", userPhone);
		
		return count;
	}

	//TODO 작성만 실행은 아직
	public static int joinProc(UserVo userVo) {
		SqlSession session = factory.openSession();
		
		
		int count = session.insert("movingHair.joinProc", userVo);
		
		return count;
	}
}
