package com.moving.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FaqVO {
	
	private int faqId;
	private String faqTitle;
	private String faqContent;
	private String userId;
	private String userName;
	private String attachPath;
	private String attachName;
	private Timestamp writeDate;
	private Timestamp updateDate;
}
