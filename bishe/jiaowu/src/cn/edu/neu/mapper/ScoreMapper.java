package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.StudentScore;

public interface ScoreMapper {
	List<StudentScore> findNewsBySearchKeyword(Page<StudentScore> page);

	void saveNews(StudentScore news);

	void removeNews(StudentScore newsId);

	List<StudentScore> findNews(Page<StudentScore> page);

	StudentScore findNewsDetailById(String newsId);

	List<StudentScore> findAll();

}
