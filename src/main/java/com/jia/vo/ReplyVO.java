package com.jia.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int rno;
	private int bno;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
	private int visitcount;
}
