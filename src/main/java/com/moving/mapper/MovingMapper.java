package com.moving.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moving.vo.EventVO;
import com.moving.vo.NoticeVO;
import com.moving.vo.PagingVO;

@Repository
public interface MovingMapper {

	List<EventVO> eventList(PagingVO paging);

	int eventListCnt();

	EventVO eventDetail(int eventId);

	List<NoticeVO> noticeList(PagingVO paging);

	int noticeListCnt();

	//int eventUpdateHitCnt(int eventId);
	


}