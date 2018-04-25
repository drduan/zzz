package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.CourseMapper;
import cn.edu.neu.model.Course;
import cn.edu.neu.model.SuccessTakeCourse;
import cn.edu.neu.model.TakeCourse;
import cn.edu.neu.service.CourseService;

@Service
@Transactional // 此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class CourseServiceImpl implements CourseService {

	@Resource
	private CourseMapper mapper;

	@Override
	public void addCourse(Course course) {
		mapper.saveCourse(course);

	}
	@Override
	public void addCourse1(Course course) {
		mapper.saveCourse1(course);

	}
	@Override
	public void addTakeCourse(List<Course> course) {
		
		//int takecourseId = takecourse.getTakecourseId();

		mapper.saveTakeCourse(course);
	}
	@Override
	public Course getCourseById(String courseId) {
		// TODO Auto-generated method stub
		return mapper.findCourseById(courseId);
	}
	@Override
	public void updateCourse(Course course) {
		// TODO Auto-generated method stub
		mapper.updateCourse(course);
	}

	@Override
	public void deleteCourse(String courseId) {
		mapper.removeCourse(courseId);

	}

	@Override
	public Page<Course> getsearchCourse(String keyword,String sort) {
		Page<Course> page = new Page<Course>(15);
		String[] keywords = keyword.split(" ");
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("keywords", keywords);
		m.put("sort", sort);
		page.setParams(m);
		List<Course> courseList = mapper.findCourseByKeyword(page);
		System.out.println("-------" + courseList);
		page.setList(courseList);
		return page;
	}

	@Override
	public Page<Course> getAdminSearchCourse(String userId,String courseName) {
		String[] courseNames = null;
		if (courseName != null)
			courseNames = courseName.split("");
		Page<Course> page = new Page<Course>(8);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("userId", userId);
		m.put("courseNames", courseNames);
		page.setParams(m);
		List<Course> courseList = mapper.findCourseBySearchKeyword(page);
		page.setList(courseList);
		return page;

	}

	@Override
	public Page<Course> getAllCourse() {
		Page<Course> page = new Page<Course>(15);
		Map<String, Object> m = new HashMap<String, Object>();
		page.setParams(m);
		List<Course> courseList = mapper.findAllCourse(page);
		System.out.println(courseList);
		page.setList(courseList);
		return page;
	}
	
	@Override
	public Page<Course> getScore(String userId) {
		// TODO Auto-generated method stub
		Page<Course> page = new Page<Course>(15);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("userId", userId);
		page.setParams(m);
		List<Course> courseList=mapper.findScore(page);
		page.setList(courseList);
		return page;
	}
	
	@Override
	public Page<Course> getCourse(String userId) {
		// TODO Auto-generated method stub
		Page<Course> page = new Page<Course>(15);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("userId", userId);
		page.setParams(m);
		List<Course> courseList=mapper.findCourse(page);
		page.setList(courseList);
		return page;
	}
	
	@Override
	public Page<Course> getTakeSuccessCourse(String userId,String takecourseId) {
		// TODO Auto-generated method stub
		Page<Course> page = new Page<Course>(15);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("userId", userId);
		m.put("takecourseId", takecourseId);
		page.setParams(m);
		List<Course> courseList=mapper.findTakeSuccessCourse(page);
		page.setList(courseList);
		return page;
	}
	
	@Override
	public Page<Course> getCourseByClass(String userId,String courseClass) {
		// TODO Auto-generated method stub
		String[] courseClasss=null;
		if(courseClass!=null)
			courseClasss=courseClass.split(" ");
		Page<Course> page = new Page<Course>(15);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("userId", userId);
		m.put("courseClasss", courseClasss);
		System.out.println("=========="+m);
		page.setParams(m);
		List<Course> courseList=mapper.findCourseByClass(page);
		page.setList(courseList);
		return page;
	}
	//批量删除
	@Override
	public void delCourseByIds(String[] courseIds) {
		// TODO Auto-generated method stub
		for(int i=0;i<courseIds.length;i++){
			mapper.removeCourse(courseIds[i]);
		}
	}
	
	




}
