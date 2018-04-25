package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.NewsMapper;
import cn.edu.neu.model.News;
import cn.edu.neu.service.NewsService;

@Service
@Transactional // 此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class NewsServiceImpl implements NewsService {

	@Resource
	private NewsMapper mapper;

	@Override
	public void addNews(News news) {
		mapper.saveNews(news);

	}

	@Override
	public void deleteNews(String newsId) {
		mapper.removeNews(newsId);

	}

	@Override
	public Page<News> getAdminSearchNews(String newsName) {
		String[] newsNames = null;
		if (newsName != null)
			newsNames = newsName.split("");
		Page<News> page = new Page<News>(8);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("newsNames", newsNames);
		page.setParams(m);
		List<News> newsList = mapper.findNewsBySearchKeyword(page);
		page.setList(newsList);
		return page;

	}

	@Override
	public Page<News> getNews() {
		Page<News> page = new Page<News>(10);
		Map<String, Object> m = new HashMap<String, Object>();
		page.setParams(m);
		List<News> newsList = mapper.findNews(page);
		System.out.println(newsList);
		page.setList(newsList);
		return page;
	}
	
	@Override
	public News getNewsDetailById(String newsId) {
		News newsDetail = mapper.findNewsDetailById(newsId);
		return newsDetail;
	}


}
