package cn.edu.neu.service;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Course;
import cn.edu.neu.model.News;



public interface NewsService {
	

	void addNews(News news);
	void deleteNews (String newsId);
	
	Page<News> getAdminSearchNews(String newsName);
	Page<News> getNews();	
	News getNewsDetailById(String newsId);
}
