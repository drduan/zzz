package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.TeacherMapper;
import cn.edu.neu.model.Teacher;
import cn.edu.neu.service.TeacherService;

@Service
@Transactional // 姝ゅ涓嶅啀杩涜鍒涘缓SqlSession鍜屾彁浜や簨鍔★紝閮藉凡浜ょ敱spring鍘荤鐞嗕簡銆�
public class TeacherServiceImpl implements TeacherService {

	@Resource
	private TeacherMapper mapper;

	@Override
	public Page<Teacher> getsearchTeacher(String keyword) {
		Page<Teacher> page = new Page<Teacher>(15);
		String[] array = keyword.split(" ");

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("keywords", array);
		page.setParams(m);
		List<Teacher> teacherList = mapper.findTeacherByKeyword(page);
		page.setList(teacherList);
		return page;
	}

	@Override
	public List<Teacher> getAllCourseTeacherWithoutPage() {
		// TODO Auto-generated method stub
		List<Teacher> teacherList = mapper.findAllCourseTeacher();
		return teacherList;
	}

	@Override
	public void addTeacher(Teacher teacher) {
		mapper.saveTeacher(teacher);

	}

	@Override
	public Teacher getTeacherById(String teacherId) {
		// TODO Auto-generated method stub
		return mapper.findTeacherById(teacherId);
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		mapper.updateTeacher(teacher);
	}

	@Override
	public void deleteTeacher(String teacherId) {
		mapper.removeTeacher(teacherId);

	}

	@Override
	public Page<Teacher> getAdminSearchTeacher(String teacherName) {
		String[] teacherNames = null;
		if (teacherName != null)
			teacherNames = teacherName.split("");
		Page<Teacher> page = new Page<Teacher>(8);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("teacherNames", teacherNames);
		page.setParams(m);
		List<Teacher> teacherList = mapper.findTeacherBySearchKeyword(page);
		page.setList(teacherList);
		return page;

	}

	// 批量删除
	@Override
	public void delTeacherByIds(String[] teacherIds) {
		// TODO Auto-generated method stub
		for (int i = 0; i < teacherIds.length; i++) {
			mapper.removeTeacher(teacherIds[i]);
		}
	}

}