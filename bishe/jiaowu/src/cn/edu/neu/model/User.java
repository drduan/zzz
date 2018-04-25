package cn.edu.neu.model;

import org.springframework.web.multipart.MultipartFile;

public class User { 

	private int userId;
	private String userName;
	private String userPass;
	private String userProfession;
	private String userRecord;
	private String userClass;
	private String userPhone;
	private String userBrithday;
	private String userTime;
	private String userRank;
	private String userPic;
	private MultipartFile userPicFile;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserProfession() {
		return userProfession;
	}
	public void setUserProfession(String userProfession) {
		this.userProfession = userProfession;
	}
	public String getUserRecord() {
		return userRecord;
	}
	public void setUserRecord(String userRecord) {
		this.userRecord = userRecord;
	}
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserBrithday() {
		return userBrithday;
	}
	public void setUserBrithday(String userBrithday) {
		this.userBrithday = userBrithday;
	}
	public String getUserTime() {
		return userTime;
	}
	public void setUserTime(String userTime) {
		this.userTime = userTime;
	}
	public String getUserRank() {
		return userRank;
	}
	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public MultipartFile getUserPicFile() {
		return userPicFile;
	}
	public void setUserPicFile(MultipartFile userPicFile) {
		this.userPicFile = userPicFile;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPass=" + userPass + ", userProfession="
				+ userProfession + ", userRecord=" + userRecord + ", userClass=" + userClass + ", userPhone="
				+ userPhone + ", userBrithday=" + userBrithday + ", userTime=" + userTime + ", userRank=" + userRank
				+ ", userPic=" + userPic + ", userPicFile=" + userPicFile + "]";
	}
	public User(int userId, String userName, String userPass, String userProfession, String userRecord,
			String userClass, String userPhone, String userBrithday, String userTime, String userRank, String userPic,
			MultipartFile userPicFile) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPass = userPass;
		this.userProfession = userProfession;
		this.userRecord = userRecord;
		this.userClass = userClass;
		this.userPhone = userPhone;
		this.userBrithday = userBrithday;
		this.userTime = userTime;
		this.userRank = userRank;
		this.userPic = userPic;
		this.userPicFile = userPicFile;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	
}
