package com.moving.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moving.mapper.MovingMapper;
import com.moving.vo.EventVO;
import com.moving.vo.NoticeVO;
import com.moving.vo.PagingVO;
import com.moving.vo.ReservVO;


@Service
public class MovingHairService {
	
	
	@Autowired private MovingMapper movingMapper;

	public List<EventVO> eventList(PagingVO paging) {
		return movingMapper.eventList(paging);
	}

	public int eventListCnt() {
		return movingMapper.eventListCnt();
	}

	public EventVO eventDetail(int eventId) {
		return movingMapper.eventDetail(eventId);
	}

	public List<NoticeVO> noticeList(PagingVO paging) {
		
		return movingMapper.noticeList(paging);
	}

	public int noticeListCnt() {
	
		return movingMapper.noticeListCnt();
	}

	public List<String> designerLoungeList(String keyword) {

		return movingMapper.designerLoungeList(keyword);
	}

	public int insertReservInfo(ReservVO reservVo) {
		return movingMapper.insertReservInfo(reservVo);
	}

	public List<ReservVO> selectMyReservList(ReservVO reservVO) {

		return movingMapper.selectMyReservList(reservVO);
	}

	//디자이너에게 예약 신청한 사람들 리스트
	public List<ReservVO> selectReservList(String designerId) {

		return movingMapper.selectReservList(designerId);
	}

	public ReservVO selectReservDetail(int reservId) {

		return movingMapper.selectReservDetail(reservId);
	}

	public int myReservListCnt(ReservVO reservVO) {
		return movingMapper.myReservListCnt(reservVO);
	}

	/*public int eventUpdateHitCnt(int eventId) {
		MovingMapper movingMapper = sqlSession.getMapper(MovingMapper.class);
		return movingMapper.eventUpdateHitCnt(eventId);
	}*/

}