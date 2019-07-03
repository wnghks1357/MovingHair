package com.moving.vo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class PointVO extends PagingVO{
	
	private int userNo;
	private int userPoint;
	private int podId;
	private char pointLog;
	private int pointCount;
	private Date createdDate;
	private Date updateDate;
	//private String pointUserDateStr;
	//private String pointUserTime;
	//기간 조회를 위한 변수 추가
	private String srchTerm;
	private String startDate;
	private String endDate;
}
