package com.moving.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MovingHairManager {

	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/spring/data/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void surveyList(){
		SqlSession session = factory.openSession();
		
		//List<SurveyVo> list = session.selectList("movingHair.");
		
		//return list;
	}
}
