package cn.edu.neu.model;

import java.util.List;

public class SuccessTakeCourse {
	private int successTakeCourseId;
	private int takeCourseId;
	private int userId;
	private String successTakeCourseName;
	private String successTakeCourseRecord;
	private String successTakeCourseScore;
	private String successTakeCourseWeek;
	private String successTakeCourseTime;
	private String successTakeCourseWhere;
	private String successTakeCourseTeacher;
	private List<SuccessTakeCourse> successTakeCourse;
	public int getSuccessTakeCourseId() {
		return successTakeCourseId;
	}
	public void setSuccessTakeCourseId(int successTakeCourseId) {
		this.successTakeCourseId = successTakeCourseId;
	}
	public int getTakeCourseId() {
		return takeCourseId;
	}
	public void setTakeCourseId(int takeCourseId) {
		this.takeCourseId = takeCourseId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getSuccessTakeCourseName() {
		return successTakeCourseName;
	}
	public void setSuccessTakeCourseName(String successTakeCourseName) {
		this.successTakeCourseName = successTakeCourseName;
	}
	public String getSuccessTakeCourseRecord() {
		return successTakeCourseRecord;
	}
	public void setSuccessTakeCourseRecord(String successTakeCourseRecord) {
		this.successTakeCourseRecord = successTakeCourseRecord;
	}
	public String getSuccessTakeCourseScore() {
		return successTakeCourseScore;
	}
	public void setSuccessTakeCourseScore(String successTakeCourseScore) {
		this.successTakeCourseScore = successTakeCourseScore;
	}
	public String getSuccessTakeCourseWeek() {
		return successTakeCourseWeek;
	}
	public void setSuccessTakeCourseWeek(String successTakeCourseWeek) {
		this.successTakeCourseWeek = successTakeCourseWeek;
	}
	public String getSuccessTakeCourseTime() {
		return successTakeCourseTime;
	}
	public void setSuccessTakeCourseTime(String successTakeCourseTime) {
		this.successTakeCourseTime = successTakeCourseTime;
	}
	public String getSuccessTakeCourseWhere() {
		return successTakeCourseWhere;
	}
	public void setSuccessTakeCourseWhere(String successTakeCourseWhere) {
		this.successTakeCourseWhere = successTakeCourseWhere;
	}
	public String getSuccessTakeCourseTeacher() {
		return successTakeCourseTeacher;
	}
	public void setSuccessTakeCourseTeacher(String successTakeCourseTeacher) {
		this.successTakeCourseTeacher = successTakeCourseTeacher;
	}
	public List<SuccessTakeCourse> getSuccessTakeCourse() {
		return successTakeCourse;
	}
	public void setSuccessTakeCourse(List<SuccessTakeCourse> successTakeCourse) {
		this.successTakeCourse = successTakeCourse;
	}
	@Override
	public String toString() {
		return "SuccessTakeCourse [successTakeCourseId=" + successTakeCourseId + ", takeCourseId=" + takeCourseId
				+ ", userId=" + userId + ", successTakeCourseName=" + successTakeCourseName
				+ ", successTakeCourseRecord=" + successTakeCourseRecord + ", successTakeCourseScore="
				+ successTakeCourseScore + ", successTakeCourseWeek=" + successTakeCourseWeek
				+ ", successTakeCourseTime=" + successTakeCourseTime + ", successTakeCourseWhere="
				+ successTakeCourseWhere + ", successTakeCourseTeacher=" + successTakeCourseTeacher
				+ ", successTakeCourse=" + successTakeCourse + "]";
	}
	public SuccessTakeCourse(int successTakeCourseId, int takeCourseId, int userId, String successTakeCourseName,
			String successTakeCourseRecord, String successTakeCourseScore, String successTakeCourseWeek,
			String successTakeCourseTime, String successTakeCourseWhere, String successTakeCourseTeacher,
			List<SuccessTakeCourse> successTakeCourse) {
		super();
		this.successTakeCourseId = successTakeCourseId;
		this.takeCourseId = takeCourseId;
		this.userId = userId;
		this.successTakeCourseName = successTakeCourseName;
		this.successTakeCourseRecord = successTakeCourseRecord;
		this.successTakeCourseScore = successTakeCourseScore;
		this.successTakeCourseWeek = successTakeCourseWeek;
		this.successTakeCourseTime = successTakeCourseTime;
		this.successTakeCourseWhere = successTakeCourseWhere;
		this.successTakeCourseTeacher = successTakeCourseTeacher;
		this.successTakeCourse = successTakeCourse;
	}
	public SuccessTakeCourse() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
