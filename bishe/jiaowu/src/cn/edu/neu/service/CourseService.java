package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Course;



public interface CourseService {
	

	void addCourse(Course course);
	void addCourse1(Course course);
	void addTakeCourse(List<Course> courses);
	Course getCourseById(String courseId);
	void updateCourse(Course course);
	void deleteCourse (String courseId);
	Page<Course> getAllCourse();	
	Page<Course> getScore(String userId);
	Page<Course> getCourse(String userId);
	Page<Course> getTakeSuccessCourse(String userId,String takecourseId);
	Page<Course> getCourseByClass( String userId,String courseClass);
	Page<Course> getsearchCourse(String keyword,String sort);
	Page<Course> getAdminSearchCourse(String userId,String courseName);
	void delCourseByIds(String[] courseIds);//批量删除
	//void addTakeCourse(List<Course> course, String takecourseId);
}
