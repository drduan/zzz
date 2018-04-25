package cn.edu.neu.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value="servMgr")
public class ServiceManager {
	protected final Log log = LogFactory.getLog(getClass());

	/* 椤圭洰鎵�鐢ㄥ埌鐨� Service */
	@Autowired
	private UserService userService;
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private TakeCourseService takeCourseService;
	
	@Autowired
	private LevMessageService levMessageService;
	
	public UserService getUserService() {
		return userService;
	}
	
	public TeacherService getTeacherService() {
		return teacherService;
	}
	
	public CourseService getCourseService() {
		return courseService;
	}
	
	public TakeCourseService getTakeCourseService() {
		return takeCourseService;
	}
	
	public NewsService getNewsService() {
		return newsService;
	}

	public LevMessageService getLevMessageService() {
		return levMessageService;
	}
}
