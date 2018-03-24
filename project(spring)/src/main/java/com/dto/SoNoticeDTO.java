package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SoNoticeDTO")
public class SoNoticeDTO {
	private int noticeNum;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private String noticeWritedate;
	private int noticeReadcnt;
	
	public SoNoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SoNoticeDTO(int noticeNum, String noticeTitle, String noticeWriter, String noticeContent,
			String noticeWritedate, int noticeReadcnt) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.noticeWritedate = noticeWritedate;
		this.noticeReadcnt = noticeReadcnt;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWritedate() {
		return noticeWritedate;
	}

	public void setNoticeWritedate(String noticeWritedate) {
		this.noticeWritedate = noticeWritedate;
	}

	public int getNoticeReadcnt() {
		return noticeReadcnt;
	}

	public void setNoticeReadcnt(int noticeReadcnt) {
		this.noticeReadcnt = noticeReadcnt;
	}
}
