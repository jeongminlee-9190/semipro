package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("AdminDTO")
public class AdminDTO {
	private String adminId;
	private String adminPasswd;
	
	public AdminDTO(String adminId, String adminPasswd) {
		this.adminId = adminId;
		this.adminPasswd = adminPasswd;
	}
	public AdminDTO() {
		super();
	}
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPasswd() {
		return adminPasswd;
	}
	public void setAdminPasswd(String adminPasswd) {
		this.adminPasswd = adminPasswd;
	}
	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", adminPasswd=" + adminPasswd + "]";
	}



	
	
}
