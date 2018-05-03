package cn.edu.neu.model;

public class MailBean {

	private String context;
	private String tol;
	private String title;

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getTol() {
		return tol;
	}

	public void setTol(String tol) {
		this.tol = tol;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "MailBean [context=" + context + ", tol=" + tol + ", title=" + title + "]";
	}

}
