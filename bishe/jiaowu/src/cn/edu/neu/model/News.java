package cn.edu.neu.model;

public class News {
	private int newsId;
	private String newsName;
	private String newsText;
	private String newsPic;
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public String getNewsName() {
		return newsName;
	}
	public void setNewsName(String newsName) {
		this.newsName = newsName;
	}
	public String getNewsText() {
		return newsText;
	}
	public void setNewsText(String newsText) {
		this.newsText = newsText;
	}
	public String getNewsPic() {
		return newsPic;
	}
	public void setNewsPic(String newsPic) {
		this.newsPic = newsPic;
	}
	@Override
	public String toString() {
		return "News [newsId=" + newsId + ", newsName=" + newsName + ", newsText=" + newsText + ", newsPic=" + newsPic
				+ "]";
	}
	public News(int newsId, String newsName, String newsText, String newsPic) {
		super();
		this.newsId = newsId;
		this.newsName = newsName;
		this.newsText = newsText;
		this.newsPic = newsPic;
	}
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
