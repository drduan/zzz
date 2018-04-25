package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Teacher;

public interface TeacherService {

	Page<Teacher> getsearchTeacher(String keyword);

	Page<Teacher> getAdminSearchTeacher(String teacherName);

	void addTeacher(Teacher teacher);
	
	Teacher getTeacherById(String teacherId);

	void deleteTeacher(String teacherId);

	void updateTeacher(Teacher teacher);

	// Page<Teacher> getAllCourseTeacher();
	List<Teacher> getAllCourseTeacherWithoutPage();

	void delTeacherByIds(String[] teacherIds);// 批量删除

}