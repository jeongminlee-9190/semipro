package com.dto;

public class InterestDTO {

	private int iNum;
	private String mId;
	private String sCode;
	public InterestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InterestDTO(int iNum, String mId, String sCode) {
		super();
		this.iNum = iNum;
		this.mId = mId;
		this.sCode = sCode;
	}
	public int getiNum() {
		return iNum;
	}
	public void setiNum(int iNum) {
		this.iNum = iNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getsCode() {
		return sCode;
	}
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	
	
}
