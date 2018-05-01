package cn.edu.neu.mapper;
//实现接口

import java.util.List;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.News;

public interface NewsMapper {

	List<News> findNewsBySearchKeyword(Page<News> page);

	void saveNews(News news);

	void removeNews(String newsId);

	List<News> findNews(Page<News> page);

	News findNewsDetailById(String newsId);
}
