package dto;

public class SoDTO {
	private String soId;
	private String soPasswd;
	private String soName;
	private String soPhone;
	private String soLicense;
	private String soPost;
	private String soAddr;
	private String soLevel;
	private String soJoindate;
	
	public SoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SoDTO(String soId, String soPasswd, String soName, String soPhone, String soLicense, String soPost,
			String soAddr) {
		super();
		this.soId = soId;
		this.soPasswd = soPasswd;
		this.soName = soName;
		this.soPhone = soPhone;
		this.soLicense = soLicense;
		this.soPost = soPost;
		this.soAddr = soAddr;
	}
	public SoDTO(String soId, String soPasswd, String soName, String soPhone, String soLicense, String soPost,
			String soAddr, String soLevel, String soJoindate) {
		super();
		this.soId = soId;
		this.soPasswd = soPasswd;
		this.soName = soName;
		this.soPhone = soPhone;
		this.soLicense = soLicense;
		this.soPost = soPost;
		this.soAddr = soAddr;
		this.soLevel = soLevel;
		this.soJoindate = soJoindate;
	}
	public String getSoId() {
		return soId;
	}
	public void setSoId(String soId) {
		this.soId = soId;
	}
	public String getSoPasswd() {
		return soPasswd;
	}
	public void setSoPasswd(String soPasswd) {
		this.soPasswd = soPasswd;
	}
	public String getSoName() {
		return soName;
	}
	public void setSoName(String soName) {
		this.soName = soName;
	}
	public String getSoPhone() {
		return soPhone;
	}
	public void setSoPhone(String soPhone) {
		this.soPhone = soPhone;
	}
	public String getSoLicense() {
		return soLicense;
	}
	public void setSoLicense(String soLicense) {
		this.soLicense = soLicense;
	}
	public String getSoPost() {
		return soPost;
	}
	public void setSoPost(String soPost) {
		this.soPost = soPost;
	}
	public String getSoAddr() {
		return soAddr;
	}
	public void setSoAddr(String soAddr) {
		this.soAddr = soAddr;
	}
	public String getSoLevel() {
		return soLevel;
	}
	public void setSoLevel(String soLevel) {
		this.soLevel = soLevel;
	}
	public String getSoJoindate() {
		return soJoindate;
	}
	public void setSoJoindate(String soJoindate) {
		this.soJoindate = soJoindate;
	}
	
	
	
}