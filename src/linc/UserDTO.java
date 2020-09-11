package linc;

public class UserDTO {


	private String uID;
	private String uPwd;
	private String uNick;
	private String uEMail;
	private java.sql.Timestamp uMkday;
	private String uStat;
	private int uBlockCount;
	private String uBlockDetail;
	private String uBlockEndDay;
	private String uTempPwd;
	
	public UserDTO() {
		
	}
	
	public UserDTO(String uID, String uPwd, String uNick, String uEMail, java.sql.Timestamp uMkday, String uStat, int uBlockCount, String uBlockDetail, String uBlockEndDay, String uTempPwd){
		this.uID = uID;
		this.uPwd = uPwd;
		this.uNick = uNick;
		this.uEMail = uEMail;
		this.uMkday = uMkday;
		this.uStat = uStat;
		this.uBlockCount = uBlockCount;
		this.uBlockDetail = uBlockDetail;
		this.uBlockEndDay = uBlockEndDay;
		this.uTempPwd = uTempPwd;
		
	}
	
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public String getuEMail() {
		return uEMail;
	}
	public void setuEMail(String uEMail) {
		this.uEMail = uEMail;
	}
	public java.sql.Timestamp getuMkday() {
		return uMkday;
	}
	public void setuMkday(java.sql.Timestamp uMkday) {
		this.uMkday = uMkday;
	}
	public String getuStat() {
		return uStat;
	}
	public void setuStat(String uStat) {
		this.uStat = uStat;
	}
	public int getuBlockCount() {
		return uBlockCount;
	}
	public void setuBlockCount(int uBlockCount) {
		this.uBlockCount = uBlockCount;
	}
	public String getuBlockDetail() {
		return uBlockDetail;
	}
	public void setuBlockDetail(String uBlockDetail) {
		this.uBlockDetail = uBlockDetail;
	}
	public String getuBlockEndDay() {
		return uBlockEndDay;
	}
	public void setuBlockEndDay(String uBlockEndDay) {
		this.uBlockEndDay = uBlockEndDay;
	}
	public String getuTempPwd() {
		return uTempPwd;
	}
	public void setuTempPwd(String uTempPwd) {
		this.uTempPwd = uTempPwd;
	}

	
	
}
