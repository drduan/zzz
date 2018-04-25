package cn.edu.neu.model;

import java.util.List;

public class Teacher {
	private int teacherId;
	private String teacherName;
	private String teacherWhere;
	private List<TakeCourse> takeCourse;
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	
	public String getTeacherWhere() {
		return teacherWhere;
	}
	public void setTeacherWhere(String teacherWhere) {
		this.teacherWhere = teacherWhere;
	}
	public List<TakeCourse> getTakeCourse() {
		return takeCourse;
	}
	public void setTakeCourse(List<TakeCourse> takeCourse) {
		this.takeCourse = takeCourse;
	}
	@Override
	public String toString() {
		return "Teacher [teacherId=" + teacherId + ", teacherName=" + teacherName + ", teacherWhere=" + teacherWhere + ", takeCourse=" + takeCourse + "]";
	}
	public Teacher(int teacherId, String teacherName, String teacherWhere,
			List<TakeCourse> takeCourse) {
		super();
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		
		this.teacherWhere = teacherWhere;
		this.takeCourse = takeCourse;
	}
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
