package com.moving.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moving.vo.EventVO;
import com.moving.vo.FaqVO;
import com.moving.vo.NoticeVO;
import com.moving.vo.PagingVO;
import com.moving.vo.ReservVO;

@Repository
public interface MovingMapper {

	List<EventVO> eventList(PagingVO paging);

	int eventListCnt();

	EventVO eventDetail(int eventId);

	List<NoticeVO> noticeList(PagingVO paging);

	int noticeListCnt();

	List<String> designerLoungeList(String keyword);

	int insertReservInfo(ReservVO reservVo);

	List<ReservVO> selectMyReservList(ReservVO reservVO);

	// 디자이너에게 서비스 예약한 고객 리스트
	List<ReservVO> selectReservList(String designerId);

	ReservVO selectReservDetail(int reservId);

	int myReservListCnt(ReservVO reservVO);

	NoticeVO noticeDetail(int noticeId);

	List<FaqVO> faqList(PagingVO paging);

	int faqListCnt();

	FaqVO faqDetail(int faqId);

	//int eventUpdateHitCnt(int eventId);
	


}