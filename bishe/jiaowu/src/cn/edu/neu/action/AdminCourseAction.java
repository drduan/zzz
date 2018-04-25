package cn.edu.neu.action;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Course;
import cn.edu.neu.model.User;

@Controller
@RequestMapping("/admin/course")
public class AdminCourseAction extends BaseAction {
	
	@RequestMapping("/getAdminCourse")
	public String getAdminCourse(@RequestParam(required=false) String userId,
			@RequestParam(required = false) String courseName,Map<String, Object> m) {
		
		Page<Course> course = this.getServMgr().getCourseService().getAdminSearchCourse(userId,courseName);
		List<User> user = this.getServMgr().getUserService().getAllUser();
		m.put("course", course);
		m.put("user", user);
		return "/admin/course/courseList";
	}
	@RequestMapping("handleCourse")
	public String handleCourse(@RequestParam(required = false) String courseId, Map<String, Object> m) {
		if(courseId!=null && !courseId.equals("")){
			Course course=this.getServMgr().getCourseService().getCourseById(courseId);
			m.put("course", course);
		}
		List<User> user = this.getServMgr().getUserService().getAllUser();
		m.put("user", user);
		return "/admin/course/handleCourse";
	}
	@RequestMapping("/doHandleCourse")
	public String dohandleCourse(HttpServletRequest request, Course course) {
		if (course.getCourseId() == 0) {
			this.getServMgr().getCourseService().addCourse(course);
			this.addMessage("添加课程成功");
			this.addRedirURL("返回", "/admin/course/getAdminCourse");
		} else {
			this.getServMgr().getCourseService().updateCourse(course);
			this.addMessage("操作商品成功");
			this.addRedirURL("返回","/admin/course/getAdminCourse");	

		}
		return EXECUTE_RESULT;
	}
	@RequestMapping("/delCourse")
	public String delCourse(@RequestParam String courseId) {
		 this.getServMgr().getCourseService().deleteCourse(courseId);
		 this.addMessage("删除课程成功");
		 this.addRedirURL("返回", "/admin/course/getAdminCourse");
		 return EXECUTE_RESULT;

	
	}
	
	//批量删除
	@RequestMapping("/delCourseByIds")
	public String delCourseByIds(@RequestParam String[] courseIds,HttpServletRequest request){
		try{
			for(int i=0;i<courseIds.length;i++){
				
				}
			this.getServMgr().getCourseService().delCourseByIds(courseIds);
			this.addMessage("商品删除成功");
			this.addRedirURL("返回","/admin/course/getAdminCourse");
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("商品删除失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}



}
