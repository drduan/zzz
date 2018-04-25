package cn.edu.neu.model;

public class Course {
	
	private int courseId;
	private int takecourseId;
	private int userId;
	private String courseName;
	private String courseClass;
	private String courseRecord;
	private String courseScore;
	private String courseTime;
	private String courseWeek;
	private String courseTeacher;
	private String courseWhere;
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getTakecourseId() {
		return takecourseId;
	}
	public void setTakecourseId(int takecourseId) {
		this.takecourseId = takecourseId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseClass() {
		return courseClass;
	}
	public void setCourseClass(String courseClass) {
		this.courseClass = courseClass;
	}
	public String getCourseRecord() {
		return courseRecord;
	}
	public void setCourseRecord(String courseRecord) {
		this.courseRecord = courseRecord;
	}
	public String getCourseScore() {
		return courseScore;
	}
	public void setCourseScore(String courseScore) {
		this.courseScore = courseScore;
	}
	public String getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}
	public String getCourseWeek() {
		return courseWeek;
	}
	public void setCourseWeek(String courseWeek) {
		this.courseWeek = courseWeek;
	}
	public String getCourseTeacher() {
		return courseTeacher;
	}
	public void setCourseTeacher(String courseTeacher) {
		this.courseTeacher = courseTeacher;
	}
	public String getCourseWhere() {
		return courseWhere;
	}
	public void setCourseWhere(String courseWhere) {
		this.courseWhere = courseWhere;
	}
	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", takecourseId=" + takecourseId + ", userId=" + userId
				+ ", courseName=" + courseName + ", courseClass=" + courseClass + ", courseRecord=" + courseRecord
				+ ", courseScore=" + courseScore + ", courseTime=" + courseTime + ", courseWeek=" + courseWeek
				+ ", courseTeacher=" + courseTeacher + ", courseWhere=" + courseWhere + "]";
	}
	public Course(int courseId, int takecourseId, int userId, String courseName, String courseClass,
			String courseRecord, String courseScore, String courseTime, String courseWeek, String courseTeacher,
			String courseWhere) {
		super();
		this.courseId = courseId;
		this.takecourseId = takecourseId;
		this.userId = userId;
		this.courseName = courseName;
		this.courseClass = courseClass;
		this.courseRecord = courseRecord;
		this.courseScore = courseScore;
		this.courseTime = courseTime;
		this.courseWeek = courseWeek;
		this.courseTeacher = courseTeacher;
		this.courseWhere = courseWhere;
	}
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
