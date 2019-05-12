package com.moving.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class DesignLoungeVO {
	
	private String userId;
	private String preferAddr1;
	private String preferAddr2;
	private String preferAddr3;
	private String preferAddr4;
	private String preferAddr5;
}
