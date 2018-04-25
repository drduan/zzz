package cn.edu.neu.mapper;
//实现接口

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.User;

public interface UserMapper {

	User findById(String userId);
	List<User> findAll(Page<User> p);
	List<User> findAllUser(Page<User> page);
	User checkStudent(User user);
	int regStudent(User user);
	int checkStudentName(User user);
	User findStudent();
	User checkAdmin(User user);
	
	 void saveStudent(User user);
	 void updateStudent(User user);
	 void removeStudent(String userId);
	 
	 List<User> findStudentByKeyword(Page<User> page);
	 Page<User> findStudentBySearchKeyword(String userName);
	 List<User> findStudentBySearchKeyword(Page<User> page);
}
