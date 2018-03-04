package dto;

public class SFileDTO {
	private String fileNum;
	private String fileName;
	private String sCode;
	
	public SFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SFileDTO(String fileName, String sCode) {
		super();
		this.fileName = fileName;
		this.sCode = sCode;
	}

	public SFileDTO(String fileNum, String fileName, String sCode) {
		super();
		this.fileNum = fileNum;
		this.fileName = fileName;
		this.sCode = sCode;
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

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	
}
