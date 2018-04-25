package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.UserMapper;
import cn.edu.neu.model.Course;
import cn.edu.neu.model.User;
import cn.edu.neu.service.UserService;

@Service
@Transactional // 此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper mapper;

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		List<User> user = mapper.findAllUser(null);
		return user;
	}

	public Page<User> findAll() {
		// 开始分页
		// PageHelper.startPage();
		// 紧跟着的第一个select方法会被分页
		Page<User> page = new Page<User>(5);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("name", "%a%");
		m.put("phone", 10);
		page.setParams(m);
		List<User> findAllList = mapper.findAll(page);
		// 用Page对结果进行包装
		page.setList(findAllList);
		System.out.println(page);
		return page;
	}

	public User findById(String userId) {

		User user = mapper.findById(userId);

		return user;
	}

	@Override
	public User checkStudent(User user) {
		// TODO Auto-generated method stub
		return mapper.checkStudent(user);
	}

	@Override
	public boolean regStudent(User user) {
		// TODO Auto-generated method stub
		if (mapper.checkStudentName(user) == 0) {
			try {
				System.out.println(mapper.regStudent(user));
				// System.out.println(user);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		} else
			return false;
	}

	@Override
	public User getStudent() {
		// TODO Auto-generated method stub
		return mapper.findStudent();
	}

	@Override
	public boolean checkStudentName(String userName) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserName(userName);
		if (mapper.checkStudentName(user) == 0)
			return true;
		else
			return false;
	}

	@Override
	public User checkAdmin(User user) {
		// TODO Auto-generated method stub
		return mapper.checkAdmin(user);
	}

	@Override
	public void addStudent(User user) {
		mapper.saveStudent(user);

	}

	@Override
	public void deleteStudent(String userId) {
		mapper.removeStudent(userId);

	}

	@Override
	public Page<User> getsearchStudent(String keyword) {
		Page<User> page = new Page<User>(8);
		String[] array = keyword.split(" ");

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("keywords", array);

		page.setParams(m);
		List<User> userList = mapper.findStudentByKeyword(page);
		page.setList(userList);
		return page;
	}

	@Override
	public Page<User> getAdminSearchStudent(String userName) {
		String[] userNames = null;
		if (userName != null)
			userNames = userName.split("");
		Page<User> page = new Page<User>(8);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("userNames", userNames);
		page.setParams(m);
		List<User> userList = mapper.findStudentBySearchKeyword(page);
		page.setList(userList);
		return page;

	}

	@Override
	public void updateStudent(User user) {
		// TODO Auto-generated method stub
		mapper.updateStudent(user);
	}

	// 批量删除
	@Override
	public void delUserByIds(String[] userIds) {
		// TODO Auto-generated method stub
		for (int i = 0; i < userIds.length; i++) {
			mapper.removeStudent(userIds[i]);
		}
	}

}
