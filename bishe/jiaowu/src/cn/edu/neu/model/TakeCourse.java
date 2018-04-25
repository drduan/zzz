package cn.edu.neu.model;

import java.util.List;

public class TakeCourse {
	private int takecourseId;
	private String takecourseName;
	private String takecourseRecord;
	private String takecourseClass;
	private String takecourseScore;
	private String takecourseTime;
	private String takecourseWeek;
	// private List<Where> where;
	private List<Teacher> teacher;
	public int getTakecourseId() {
		return takecourseId;
	}
	public void setTakecourseId(int takecourseId) {
		this.takecourseId = takecourseId;
	}
	public String getTakecourseName() {
		return takecourseName;
	}
	public void setTakecourseName(String takecourseName) {
		this.takecourseName = takecourseName;
	}
	public String getTakecourseRecord() {
		return takecourseRecord;
	}
	public void setTakecourseRecord(String takecourseRecord) {
		this.takecourseRecord = takecourseRecord;
	}
	public String getTakecourseClass() {
		return takecourseClass;
	}
	public void setTakecourseClass(String takecourseClass) {
		this.takecourseClass = takecourseClass;
	}
	public String getTakecourseScore() {
		return takecourseScore;
	}
	public void setTakecourseScore(String takecourseScore) {
		this.takecourseScore = takecourseScore;
	}
	public String getTakecourseTime() {
		return takecourseTime;
	}
	public void setTakecourseTime(String takecourseTime) {
		this.takecourseTime = takecourseTime;
	}
	public String getTakecourseWeek() {
		return takecourseWeek;
	}
	public void setTakecourseWeek(String takecourseWeek) {
		this.takecourseWeek = takecourseWeek;
	}
	public List<Teacher> getTeacher() {
		return teacher;
	}
	public void setTeacher(List<Teacher> teacher) {
		this.teacher = teacher;
	}
	@Override
	public String toString() {
		return "TakeCourse [takecourseId=" + takecourseId + ", takecourseName=" + takecourseName + ", takecourseRecord="
				+ takecourseRecord + ", takecourseClass=" + takecourseClass + ", takecourseScore=" + takecourseScore
				+ ", takecourseTime=" + takecourseTime + ", takecourseWeek=" + takecourseWeek + ", teacher=" + teacher
				+ "]";
	}
	public TakeCourse(int takecourseId, String takecourseName, String takecourseRecord, String takecourseClass,
			String takecourseScore, String takecourseTime, String takecourseWeek, List<Teacher> teacher) {
		super();
		this.takecourseId = takecourseId;
		this.takecourseName = takecourseName;
		this.takecourseRecord = takecourseRecord;
		this.takecourseClass = takecourseClass;
		this.takecourseScore = takecourseScore;
		this.takecourseTime = takecourseTime;
		this.takecourseWeek = takecourseWeek;
		this.teacher = teacher;
	}
	public TakeCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
