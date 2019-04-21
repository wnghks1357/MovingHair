package com.moving.vo;

import java.sql.Timestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReservVO {
	
	private int reservId;
	private String userId;
	private Timestamp reservDate;
	private String designerId;
	private Timestamp createdDate;
	private Timestamp updateDate;
	private int changeCount;
	
}
