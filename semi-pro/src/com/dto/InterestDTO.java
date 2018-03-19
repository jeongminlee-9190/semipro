package com.dto;

public class InterestDTO {

	private String iCode;
	private String mId;
	private String sCode;
	public InterestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InterestDTO(String iCode, String mId, String sCode) {
		super();
		this.iCode = iCode;
		this.mId = mId;
		this.sCode = sCode;
	}
	public String getiCode() {
		return iCode;
	}
	public void setiCode(String iCode) {
		this.iCode = iCode;
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
