package com.dto;

import org.apache.ibatis.type.Alias;

//shop 테이블에 대한 DTO
@Alias("SDTO")
public class SDTO {
  	private String sCode;
	private String sName;
	private String soId;
	private String sPost;
  	private String sAddr;
	private String sPhone;
	private String sCategory;
	private String sBusinesshours;
	private String sParkinglot;
	private String sTerrace;
	private String sMenu1;
	private String sMenu2;
	private String sImage;
	private String sLike;
	private String sSubway;

	
	public SDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public SDTO(String sCode, String sName, String soId, String sPost, String sAddr, String sPhone, String sCategory,
			String sBusinesshours, String sParkinglot, String sTerrace, String sMenu1, String sMenu2, String sSubway) {
		super();
		this.sCode = sCode;
		this.sName = sName;
		this.soId = soId;
		this.sPost = sPost;
		this.sAddr = sAddr;
		this.sPhone = sPhone;
		this.sCategory = sCategory;
		this.sBusinesshours = sBusinesshours;
		this.sParkinglot = sParkinglot;
		this.sTerrace = sTerrace;
		this.sMenu1 = sMenu1;
		this.sMenu2 = sMenu2;
		this.sSubway = sSubway;

	}


	public SDTO(String sCode, String sName, String soId, String sPost, String sAddr, String sPhone, String sCategory,
			String sBusinesshours, String sParkinglot, String sTerrace, String sMenu1, String sMenu2, String sImage,
			String sLike,String sSubway) {
		super();
		this.sCode = sCode;
		this.sName = sName;
		this.soId = soId;
		this.sPost = sPost;
		this.sAddr = sAddr;
		this.sPhone = sPhone;
		this.sCategory = sCategory;
		this.sBusinesshours = sBusinesshours;
		this.sParkinglot = sParkinglot;
		this.sTerrace = sTerrace;
		this.sMenu1 = sMenu1;
		this.sMenu2 = sMenu2;
		this.sImage = sImage;
		this.sLike = sLike;
		this.sSubway = sSubway;
	}


	public String getsCode() {
		return sCode;
	}


	public void setsCode(String sCode) {
		this.sCode = sCode;
	}


	public String getsName() {
		return sName;
	}


	public void setsName(String sName) {
		this.sName = sName;
	}


	public String getSoId() {
		return soId;
	}


	public void setSoId(String soId) {
		this.soId = soId;
	}


	public String getsPost() {
		return sPost;
	}


	public void setsPost(String sPost) {
		this.sPost = sPost;
	}


	public String getsAddr() {
		return sAddr;
	}


	public void setsAddr(String sAddr) {
		this.sAddr = sAddr;
	}


	public String getsPhone() {
		return sPhone;
	}


	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}


	public String getsCategory() {
		return sCategory;
	}


	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}


	public String getsBusinesshours() {
		return sBusinesshours;
	}


	public void setsBusinesshours(String sBusinesshours) {
		this.sBusinesshours = sBusinesshours;
	}


	public String getsParkinglot() {
		return sParkinglot;
	}


	public void setsParkinglot(String sParkinglot) {
		this.sParkinglot = sParkinglot;
	}


	public String getsTerrace() {
		return sTerrace;
	}


	public void setsTerrace(String sTerrace) {
		this.sTerrace = sTerrace;
	}


	public String getsMenu1() {
		return sMenu1;
	}


	public void setsMenu1(String sMenu1) {
		this.sMenu1 = sMenu1;
	}


	public String getsMenu2() {
		return sMenu2;
	}


	public void setsMenu2(String sMenu2) {
		this.sMenu2 = sMenu2;
	}


	public String getsImage() {
		return sImage;
	}


	public void setsImage(String sImage) {
		this.sImage = sImage;
	}


	public String getsLike() {
		return sLike;
	}


	public void setsLike(String sLike) {
		this.sLike = sLike;
	}


	public String getsSubway() {
		return sSubway;
	}


	public void setsSubway(String sSubway) {
		this.sSubway = sSubway;
	}
}
