package com.dto;

public class SFileDTO {
	private String fileNum;
	private String fileName;
	private String soId;
	
	public SFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SFileDTO(String fileName, String soId) {
		super();
		this.fileName = fileName;
		this.soId = soId;
	}

	public SFileDTO(String fileNum, String fileName, String soId) {
		super();
		this.fileNum = fileNum;
		this.fileName = fileName;
		this.soId = soId;
	}

	public String getFileNum() {
		return fileNum;
	}

	public void setFileNum(String fileNum) {
		this.fileNum = fileNum;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getsoId() {
		return soId;
	}

	public void setsoId(String soId) {
		this.soId = soId;
	}
	
}
