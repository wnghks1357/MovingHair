package com.moving.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReservVO extends PagingVO{
	
	private int reservId;
	private String userId;
	private Timestamp reservDate;
	private String designerId;
	private String reservLoc;
	private String reservMsg;
	private Date createdDate;
	private Date updateDate;
	private int changeCount;
	
	private String reservDateStr;
	
}
