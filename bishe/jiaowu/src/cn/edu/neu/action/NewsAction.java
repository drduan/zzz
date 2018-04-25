package cn.edu.neu.action;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.News;


@Controller
@RequestMapping("/news")
public class NewsAction extends BaseAction {
	
	@RequestMapping("/getNews")
	public String getNews(Map<String, Page<News>> m) {
		Page<News> news = this.getServMgr().getNewsService().getNews();
		m.put("news", news);
		return "/schoolNews";
	}
	
	@RequestMapping("/getNewsDetailById")
	public String getNewsDetailById(@RequestParam String newsId, Map<String, News> m)
			throws UnsupportedEncodingException {
		News newsDetail = this.getServMgr().getNewsService().getNewsDetailById(newsId);
		m.put("newsDetail", newsDetail);
		return "/schoolNewsDetail";

	}
	


}
