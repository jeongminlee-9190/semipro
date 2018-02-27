package dto;

public class SFileDTO {
	private String filename;
	private String filerealname;
	
	public SFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SFileDTO(String filename, String filerealname) {
		super();
		this.filename = filename;
		this.filerealname = filerealname;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilerealname() {
		return filerealname;
	}

	public void setFilerealname(String filerealname) {
		this.filerealname = filerealname;
	}
	
	
}
