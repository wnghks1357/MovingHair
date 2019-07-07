package com.moving.vo;

import java.sql.Timestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class QnaVO {
	
	private int qnaId;
	private String userId;
	private String designerId;
	private String qnaContents;
	private int qnaSno;
	private int qnaLev;
	private int upprSno;
	private Timestamp writeDate;
	private Timestamp updateDate;
}
