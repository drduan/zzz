package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.SuccessTakeCourse;
import cn.edu.neu.model.TakeCourse;

public interface TakeCourseMapper {
	
	List<TakeCourse> findAllTakeCourse(Page<TakeCourse> page);
	List<TakeCourse> findTakeCourseByKeyword(Page<TakeCourse> page);
	void saveSuccessTakeCourse(SuccessTakeCourse stc);
	TakeCourse findTakeCourseDetailById(String takecourseId);
	TakeCourse findTakeCourseWhereById(String takecourseId);
	
	 Page<TakeCourse> findTakeCourseBySearchKeyword(String takecourseName);
	 List<TakeCourse> findTakeCourseBySearchKeyword(Page<TakeCourse> page);
	 TakeCourse findTakeCourseById(String takecourseId);
	 void saveTakeCourse(TakeCourse takecourse);
	 void updateTakeCourse(TakeCourse takecourse);
	 void removeTakeCourse(String takecourseId);
	 
	 
	 TakeCourse findTakeCourseTeacherById(String takecourseId);
	 void delTakeCourseTeacher(String takecourseId);
	 void delTakeCourseTeacher(String takecourseId, String delId);
     void saveTakeCourseTeacher(String takecourseId, String insertId);
     String[] findTakeCourseTeacherIds(String takecourseId);
	
	

	
	


}
