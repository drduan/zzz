package cn.edu.neu.model;

import java.math.BigDecimal;

public class StudentScore {

	// 学号
	private String sno;
	// 考试编号
	private String sbm;
	// 科目
	private String sname;
	// 分数
	private BigDecimal s_score;
	// 录入人
	private String lrname;
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSbm() {
		return sbm;
	}
	public void setSbm(String sbm) {
		this.sbm = sbm;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public BigDecimal getS_score() {
		return s_score;
	}
	public void setS_score(BigDecimal s_score) {
		this.s_score = s_score;
	}
	public String getLrname() {
		return lrname;
	}
	public void setLrname(String lrname) {
		this.lrname = lrname;
	}
	@Override
	public String toString() {
		return "StudentScore [sno=" + sno + ", sbm=" + sbm + ", sname=" + sname + ", s_score=" + s_score + ", lrname="
				+ lrname + ", getSno()=" + getSno() + ", getSbm()=" + getSbm() + ", getSname()=" + getSname()
				+ ", getS_score()=" + getS_score() + ", getLrname()=" + getLrname() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}
