package cn.edu.neu.model;

import java.util.List;

public class Where {
	private int whereId;
	private String whereName;
	private List<TakeCourse> takeCourse;
	@Override
	public String toString() {
		return "Where [whereId=" + whereId + ", whereName=" + whereName + ", takeCourse=" + takeCourse + "]";
	}
	public Where(int whereId, String whereName, List<TakeCourse> takeCourse) {
		super();
		this.whereId = whereId;
		this.whereName = whereName;
		this.takeCourse = takeCourse;
	}
	public Where() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getWhereId() {
		return whereId;
	}
	public void setWhereId(int whereId) {
		this.whereId = whereId;
	}
	public String getWhereName() {
		return whereName;
	}
	public void setWhereName(String whereName) {
		this.whereName = whereName;
	}
	public List<TakeCourse> getTakeCourse() {
		return takeCourse;
	}
	public void setTakeCourse(List<TakeCourse> takeCourse) {
		this.takeCourse = takeCourse;
	}
	
	
	
	
	
	
	
	

}
