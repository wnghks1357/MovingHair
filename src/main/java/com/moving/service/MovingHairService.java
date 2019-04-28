package com.moving.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moving.mapper.MovingMapper;


@Service
public class MovingHairService {
	@Autowired SqlSession sqlSession;

}