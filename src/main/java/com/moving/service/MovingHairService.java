package com.moving.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moving.mapper.MovingMapper;
import com.moving.vo.EventVO;
import com.moving.vo.NoticeVO;
import com.moving.vo.PagingVO;
import com.moving.vo.ReservVO;


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

	public List<NoticeVO> noticeList(PagingVO paging) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.noticeList(paging);
	}

	public int noticeListCnt() {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.noticeListCnt();
	}

	public List<String> designerLoungeList(String keyword) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.designerLoungeList(keyword);
	}

	public int insertReservInfo(ReservVO reservVo) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.insertReservInfo(reservVo);
	}

	public List<ReservVO> selectMyReservList(ReservVO reservVO) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.selectMyReservList(reservVO);
		
	}

	//디자이너에게 예약 신청한 사람들 리스트
	public List<ReservVO> selectReservList(String designerId) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.selectReservList(designerId);
	}

	public ReservVO selectReservDetail(int reservId) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.selectReservDetail(reservId);
	}

	/*public int eventUpdateHitCnt(int eventId) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.eventUpdateHitCnt(eventId);
	}*/

}