package com.dto;

public class SearchResultDTO {
	
	//score
		private String category;
		private String sCode;
		private int good;
		private int bad;
		private int scoresum;
		
		//shop
		private String sName;
		private String soId;
		private String sPost;
		private String sAddr;
		private String sPhone;
		private String sBusinesshours;
		private String sParkinglot;
		private String sTerrace;
		private String sMenu1;
		private String sMenu2;
		private String sCategory;
		private String sImage;
		private int sLike;
		private int sHate;
		private int sInterest;
		private String sSubway;
		public SearchResultDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public SearchResultDTO(String category, String sCode, int good, int bad, int scoresum, String sName,
				String soId, String sPost, String sAddr, String sPhone, String sBusinesshours, String sParkinglot,
				String sTerrace, String sMenu1, String sMenu2, String sCategory, String sImage, int sLike, int sHate,
				int sInterest, String sSubway) {
			super();
			this.category = category;
			this.sCode = sCode;
			this.good = good;
			this.bad = bad;
			this.scoresum = scoresum;
			this.sName = sName;
			this.soId = soId;
			this.sPost = sPost;
			this.sAddr = sAddr;
			this.sPhone = sPhone;
			this.sBusinesshours = sBusinesshours;
			this.sParkinglot = sParkinglot;
			this.sTerrace = sTerrace;
			this.sMenu1 = sMenu1;
			this.sMenu2 = sMenu2;
			this.sCategory = sCategory;
			this.sImage = sImage;
			this.sLike = sLike;
			this.sHate = sHate;
			this.sInterest = sInterest;
			this.sSubway = sSubway;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
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
		public int getScoresum() {
			return scoresum;
		}
		public void setScoresum(int scoresum) {
			this.scoresum = scoresum;
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
		public String getsCategory() {
			return sCategory;
		}
		public void setsCategory(String sCategory) {
			this.sCategory = sCategory;
		}
		public String getsImage() {
			return sImage;
		}
		public void setsImage(String sImage) {
			this.sImage = sImage;
		}
		public int getsLike() {
			return sLike;
		}
		public void setsLike(int sLike) {
			this.sLike = sLike;
		}
		public int getsHate() {
			return sHate;
		}
		public void setsHate(int sHate) {
			this.sHate = sHate;
		}
		public int getsInterest() {
			return sInterest;
		}
		public void setsInterest(int sInterest) {
			this.sInterest = sInterest;
		}
		public String getsSubway() {
			return sSubway;
		}
		public void setsSubway(String sSubway) {
			this.sSubway = sSubway;
		}
		@Override
		public String toString() {
			return "SearchResultDTO [category=" + category + ", sCode=" + sCode + ", good=" + good + ", bad=" + bad
					+ ", scoresum=" + scoresum + ", sName=" + sName + ", soId=" + soId + ", sPost=" + sPost + ", sAddr="
					+ sAddr + ", sPhone=" + sPhone + ", sBusinesshours=" + sBusinesshours + ", sParkinglot="
					+ sParkinglot + ", sTerrace=" + sTerrace + ", sMenu1=" + sMenu1 + ", sMenu2=" + sMenu2
					+ ", sCategory=" + sCategory + ", sImage=" + sImage + ", sLike=" + sLike + ", sHate=" + sHate
					+ ", sInterest=" + sInterest + ", sSubway=" + sSubway + "]";
		}
		
		

}
