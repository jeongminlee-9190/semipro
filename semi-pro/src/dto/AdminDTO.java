package dto;

public class AdminDTO {
	private String aId;
	private String aPasswd;
	public AdminDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminDTO(String aId, String aPasswd) {
		super();
		this.aId = aId;
		this.aPasswd = aPasswd;
	}
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getaPasswd() {
		return aPasswd;
	}
	public void setaPasswd(String aPasswd) {
		this.aPasswd = aPasswd;
	}
}
