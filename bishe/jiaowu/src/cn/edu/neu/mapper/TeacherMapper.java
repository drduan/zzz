package cn.edu.neu.mapper;
//实现接口

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Teacher;

public interface TeacherMapper {

	List<Teacher> findTeacherByKeyword(Page<Teacher> page);

	// Page<Teacher> findTeacherBySearchKeyword(String teacherName);
	List<Teacher> findTeacherBySearchKeyword(Page<Teacher> page);

	Teacher findTeacherById(String teacherId);

	void updateTeacher(Teacher teacher);

	void removeTeacher(String teacherd);

	void saveTeacher(Teacher teacher);

	List<Teacher> findAllCourseTeacher();
}