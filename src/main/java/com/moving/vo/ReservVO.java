package com.moving.vo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReservVO {
	
	private int reservId;
	private String userId;
	private Date reservDate;
	private String designerId;
	private String reservLoc;
	private String reservMsg;
	private Date createdDate;
	private Date updateDate;
	private int changeCount;
	
}
