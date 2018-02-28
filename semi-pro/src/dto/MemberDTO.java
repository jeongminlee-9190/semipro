package dto;

public class MemberDTO {
   private int rownum;
   private String mId;
   private String mPasswd;
   private String mName;
   private int mPhone1;
   private int mPhone2;
   private int mPhone3;
   public MemberDTO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public MemberDTO(int rownum,String mId, String mPasswd, String mName, int mPhone1, int mPhone2, int mPhone3) {
      super();
      this.rownum=rownum;
      this.mId = mId;
      this.mPasswd = mPasswd;
      this.mName = mName;
      this.mPhone1 = mPhone1;
      this.mPhone2 = mPhone2;
      this.mPhone3 = mPhone3;
   }
   public int getRownum() {
	return rownum;
}
public void setRownum(int rownum) {
	this.rownum = rownum;
}
public String getmId() {
      return mId;
   }
   public void setmId(String mId) {
      this.mId = mId;
   }
   public String getmPasswd() {
      return mPasswd;
   }
   public void setmPasswd(String mPasswd) {
      this.mPasswd = mPasswd;
   }
   public String getmName() {
      return mName;
   }
   public void setmName(String mName) {
      this.mName = mName;
   }
   public int getmPhone1() {
      return mPhone1;
   }
   public void setmPhone1(int mPhone1) {
      this.mPhone1 = mPhone1;
   }
   public int getmPhone2() {
      return mPhone2;
   }
   public void setmPhone2(int mPhone2) {
      this.mPhone2 = mPhone2;
   }
   public int getmPhone3() {
      return mPhone3;
   }
   public void setmPhone3(int mPhone3) {
      this.mPhone3 = mPhone3;
   }
   
   

}