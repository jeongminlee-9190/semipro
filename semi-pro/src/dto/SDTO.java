package dto;
//shop 테이블에 대한 DTO
public class SDTO {
  	private String sCode;
	private String sName;
	private String soId;
	private String sPost;
  	private String sAddr;
	private String sPhone;
	private String sRecomendedscore;
	private String sCategory;
	private String sImage1;
	private String sImage2;
	
	public SDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SDTO(String sCode, String sName, String soId, String sPost, String sAddr, String sPhone,
			String sRecomendedscore, String sCategory, String sImage1, String sImage2) {
		super();
		this.sCode = sCode;
		this.sName = sName;
		this.soId = soId;
		this.sPost = sPost;
		this.sAddr = sAddr;
		this.sPhone = sPhone;
		this.sRecomendedscore = sRecomendedscore;
		this.sCategory = sCategory;
		this.sImage1 = sImage1;
		this.sImage2 = sImage2;
	}



	public SDTO(String sCode, String sName, String soId, String sPost, String sAddr, String sPhone, String sCategory) {
		super();
		this.sCode = sCode;
		this.sName = sName;
		this.soId = soId;
		this.sPost = sPost;
		this.sAddr = sAddr;
		this.sPhone = sPhone;
		this.sCategory = sCategory;
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

	public String getsRecomendedscore() {
		return sRecomendedscore;
	}

	public void setsRecomendedscore(String sRecomendedscore) {
		this.sRecomendedscore = sRecomendedscore;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public String getsImage1() {
		return sImage1;
	}

	public void setsImage1(String sImage1) {
		this.sImage1 = sImage1;
	}

	public String getsImage2() {
		return sImage2;
	}

	public void setsImage2(String sImage2) {
		this.sImage2 = sImage2;
	}

	public String getsPost() {
		return sPost;
	}

	public void setsPost(String sPost) {
		this.sPost = sPost;
	}	
	
}
