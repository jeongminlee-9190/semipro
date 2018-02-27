package dto;

public class SoDTO {
	private String oId;
	private String oPasswd;
	private String oName;
	private String oPhone;
	private String sName;
	private String sPhone;
	private String sLicense;
	private String sPost;
	private String sAddr;
	private String sLevel;
	private String sJoindate;
	
	public SoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public SoDTO(String oId, String oPasswd, String oName, String oPhone, String sName, String sPhone, String sLicense,
			String sPost, String sAddr) {
		super();
		this.oId = oId;
		this.oPasswd = oPasswd;
		this.oName = oName;
		this.oPhone = oPhone;
		this.sName = sName;
		this.sPhone = sPhone;
		this.sLicense = sLicense;
		this.sPost = sPost;
		this.sAddr = sAddr;
	}

	public SoDTO(String oId, String oPasswd, String oName, String oPhone, String sName, String sPhone, String sLicense,
			String sPost, String sAddr, String sLevel, String sJoindate) {
		super();
		this.oId = oId;
		this.oPasswd = oPasswd;
		this.oName = oName;
		this.oPhone = oPhone;
		this.sName = sName;
		this.sPhone = sPhone;
		this.sLicense = sLicense;
		this.sPost = sPost;
		this.sAddr = sAddr;
		this.sLevel = sLevel;
		this.sJoindate = sJoindate;
	}


	public String getoId() {
		return oId;
	}

	public void setoId(String oId) {
		this.oId = oId;
	}

	public String getoPasswd() {
		return oPasswd;
	}

	public void setoPasswd(String oPasswd) {
		this.oPasswd = oPasswd;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public String getoPhone() {
		return oPhone;
	}

	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsLicense() {
		return sLicense;
	}

	public void setsLicense(String sLicense) {
		this.sLicense = sLicense;
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

	public String getsLevel() {
		return sLevel;
	}

	public void setsLevel(String sLevel) {
		this.sLevel = sLevel;
	}


	public String getsJoindate() {
		return sJoindate;
	}


	public void setsJoindate(String sJoindate) {
		this.sJoindate = sJoindate;
	}
		
	
}