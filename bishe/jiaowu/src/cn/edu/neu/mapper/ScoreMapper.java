package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.MailBean;
import cn.edu.neu.model.StudentScore;

public interface ScoreMapper {

	void saveNews(StudentScore news);

	void removeNews(StudentScore newsId);

	List<StudentScore> findAll();

	List<MailBean> findAllForMail();
}
