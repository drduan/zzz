package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.User;


public interface UserService {
	
	User findById(String userId);
	Page<User> findAll();
	List<User> getAllUser();
	User checkStudent(User user);
	boolean regStudent(User user);
	boolean checkStudentName(String userName);
	User getStudent();
	User checkAdmin(User user);
	void addStudent(User user);
	void deleteStudent (String userId);
	void updateStudent(User user);
	Page<User> getsearchStudent(String keyword);
	Page<User> getAdminSearchStudent(String userName);
	void delUserByIds(String[] courseIds);//批量删除
}
