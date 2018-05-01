package cn.edu.neu.service;



import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Course;
import cn.edu.neu.model.StudentScore;
import cn.edu.neu.model.SuccessTakeCourse;
import cn.edu.neu.model.TakeCourse;

public interface TakeCourseService {
	Page<TakeCourse> getTakeCourse(String sort);
	Page<TakeCourse> getsearchTakeCourse(String keyword,String sort);
	TakeCourse getTakeCourseDetailById(String takecourseId);
	TakeCourse getTakeCourseWhereById(String takecourseId);
	//TakeCourse getTakeCourseTeacherById(String takecourseId);
	//int addTakeCourse(TakeCourse takecourse,List<SuccessTakeCourse> successTakeCourse);
	void addTakeCourse(TakeCourse takecourse);
	TakeCourse getTakeCourseById(String takecourseId);
	void updateTakeCourse(TakeCourse takecourse);
	void deleteTakeCourse (String takecourseId);
	Page<TakeCourse> getAdminSearchTakeCourse(String takecourseName);
	void delTakeCourseByIds(String[] takecourseIds);//批量删除
	
	TakeCourse getTakeCourseTeacherById(String takecourseId);
	void updateTakeCourseTeacherById(String takecourseId, List<String> insertIdsIds,List<String> delIdsIds);
	String[] getTakeCourseTeacherIds(String takecourseId);

	void saveScore(StudentScore score);
	

}
