package com.moving.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class EventVO {
	
	private int eventId;
	private String eventTitle;
	private String eventContent;
	private Date eventStartDt;
	private Date eventEndDt;
	private String userId;
	private String userName;
	private String attachPath;
	private String attachName;
	private Timestamp writeDate;
	private Timestamp updateDate;
	
}
