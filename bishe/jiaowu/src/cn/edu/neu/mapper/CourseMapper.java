package cn.edu.neu.mapper;
//实现接口

import java.util.List;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Course;

public interface CourseMapper {

   	 List<Course> findCourseByKeyword(Page<Course> page);
	 Page<Course> findCourseBySearchKeyword(String courseName);
	 List<Course> findCourseBySearchKeyword(Page<Course> page);
	 Course findCourseById(String courseId);
	 void saveCourse(Course course);
	 void saveCourse1(Course course);
	 void updateCourse(Course course);
	 void removeCourse(String courseId);
	 void saveTakeCourse(List<Course> course, String takecourseId);
	 List<Course> findAllCourse(Page<Course> page);
	 List<Course> findScore(Page<Course> page);
	 List<Course> findCourse(Page<Course> page);
	 List<Course> findTakeSuccessCourse(Page<Course> page);
	 List<Course> findCourseByClass(Page<Course> page);
	void saveTakeCourse(List<Course> course);
}
