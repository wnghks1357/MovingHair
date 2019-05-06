package com.moving.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moving.mapper.MovingMapper;
import com.moving.mapper.UserMapper;
import com.moving.vo.EventVO;
import com.moving.vo.PagingVO;


@Service
public class MovingHairService {
	@Autowired SqlSession sqlSession;

	public List<EventVO> eventList(PagingVO paging) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.eventList(paging);
	}

	public int eventListCnt() {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.eventListCnt();
	}

	public EventVO eventDetail(int eventId) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.eventDetail(eventId);
	}

}