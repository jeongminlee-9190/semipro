package com.dto;

public class ScoreDTO {
	
	private String sCategory;
	private String sCode;
	private int good;
	private int bad;
	private int scoreSum;
	public ScoreDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ScoreDTO(String sCategory, String sCode, int good, int bad, int scoreSum) {
		super();
		this.sCategory = sCategory;
		this.sCode = sCode;
		this.good = good;
		this.bad = bad;
		this.scoreSum = scoreSum;
	}
	public String getsCategory() {
		return sCategory;
	}
	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}
	public String getsCode() {
		return sCode;
	}
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public int getScoreSum() {
		return scoreSum;
	}
	public void setScoreSum(int scoreSum) {
		this.scoreSum = scoreSum;
	}

}
