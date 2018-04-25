package cn.edu.neu.action;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Course;


@Controller
@RequestMapping("/course")
public class CourseAction extends BaseAction {
	
	@RequestMapping("/getAllCourse")
	public String getAllCourse(Map<String, Page<Course>> m) {
		Page<Course> course = this.getServMgr().getCourseService().getAllCourse();
		m.put("course", course);
		return "/allCourse";
	}
	
	@RequestMapping("/getScore")
	public String getScore(@RequestParam String userId,Map<String,Page<Course>> m){
		Page<Course> course=this.getServMgr().getCourseService().getScore(userId);
		m.put("course", course);
		//System.out.println(goods.getList());
		return "/studentScore";
	}
	
	@RequestMapping("/searchCourse")
	public String searchCourse(HttpServletRequest request,@RequestParam String keyword,@RequestParam(required=false) String sort,Map<String,Page<Course>> m) throws UnsupportedEncodingException{
		System.out.println(keyword);
		Page<Course> searchCourse=this.getServMgr().getCourseService().getsearchCourse(keyword,sort);
		m.put("searchCourse", searchCourse);
		
		return "/searchCourse";
	}
	
	@RequestMapping("/getCourse")
	public String getCourse(@RequestParam String userId,Map<String,Page<Course>> m){
		Page<Course> course=this.getServMgr().getCourseService().getCourse(userId);
		m.put("course", course);
		//System.out.println(goods.getList());
		return "/studentCourse";
	}
	
	@RequestMapping("/getTakeSuccessCourse")
	public String getTakeSuccessCourse(@RequestParam String userId,
			@RequestParam String takecourseId,Map<String,Page<Course>> m){
		Page<Course> course=this.getServMgr().getCourseService().getTakeSuccessCourse(userId, takecourseId);
		m.put("course", course);
		//System.out.println(goods.getList());
		return "/addCourse1";
	}
	
	@RequestMapping("/getCourseByClass")
	public String getCourseByClass(@RequestParam String userId,
			@RequestParam(required=false) String courseClass,Map<String,Object> m){
		Page<Course> course=this.getServMgr().getCourseService().getCourseByClass(userId,courseClass);
		m.put("course", course);
		System.out.println(course);
		return "/studentClass";
	}
	


}
