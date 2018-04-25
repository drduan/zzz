package cn.edu.neu.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Course;
import cn.edu.neu.model.SuccessTakeCourse;
import cn.edu.neu.model.TakeCourse;


@Controller
@RequestMapping("/takecourse")

public class TakeCourseAction extends BaseAction {

	@RequestMapping("/getTakeCourse")
	public String getTakeCourse(@RequestParam(required = false) String sort,
			Map<String, Page<TakeCourse>> m) {
		Page<TakeCourse> takecourse = this.getServMgr().getTakeCourseService().getTakeCourse(sort);
		m.put("takecourse", takecourse);

		return "/addCourse1";
	}

	@RequestMapping("/searchTakeCourse")
	public String searchTakeCourse(@RequestParam String keyword, @RequestParam(required = false) String sort,
			Map<String, Page<TakeCourse>> m) throws UnsupportedEncodingException {
		Page<TakeCourse> takecourse = this.getServMgr().getTakeCourseService().getsearchTakeCourse(keyword, sort);
		m.put("takecourse", takecourse);

		return "/addCourse1";

	}

	@RequestMapping("/getTakeCourseDetailById")
	public String getTakeCourseDetailById(@RequestParam String takecourseId, Map<String, TakeCourse> m)
			throws UnsupportedEncodingException {
		TakeCourse takecourseDetail = this.getServMgr().getTakeCourseService().getTakeCourseDetailById(takecourseId);
		//TakeCourse takecourseWhere = this.getServMgr().getTakeCourseService().getTakeCourseWhereById(takecourseId);
		TakeCourse takecourseTeacher = this.getServMgr().getTakeCourseService().getTakeCourseTeacherById(takecourseId);
		m.put("takecourseDetail", takecourseDetail);
		//m.put("takecourseWhere", takecourseWhere);
		m.put("takecourseTeacher", takecourseTeacher);
		return "/TakeCourseDetail";

	}
	/*@RequestMapping("/addTakeCourse")
	public String addTakeCourse(@RequestParam(required = false) String[] takecourseId,
			@RequestParam(required = false) String[] takecourseName, 
			@RequestParam(required = false) String[] takecourseRecord,
			@RequestParam(required = false) String[] takecourseScore, 
			@RequestParam(required = false) String[] takecourseWeek,
			@RequestParam(required = false) String[] takecourseTime,
			@RequestParam(required = false) String[] where, 
			@RequestParam(required = false) String[] teacher,

			Map<String, Object> m) {

		m.put("takecourseId", takecourseId);
		m.put("takecourseName", takecourseName);
		m.put("takecourseRecord", takecourseRecord);
		m.put("takecourseScore", takecourseScore);
		m.put("takecourseWeek", takecourseWeek);
		m.put("takecourseTime", takecourseTime);
		m.put("where", where);
		m.put("teacher", teacher);	
		return "/addTakeCourse";

	}*/
	/*@RequestMapping("/addSuccessTakeCourse")
	public String addSuccessTakeCourse(HttpServletRequest request, Course course) {
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
	}*/
	/*@RequestMapping("/addSuccessTakeCourse")
	public String addSuccessTakeCourse( HttpSession session,
			@RequestParam(required = false) String[] takecourseId,
			@RequestParam(required = false) String[] takecourseName, 
			@RequestParam(required = false) String[] takecourseRecord,
			@RequestParam(required = false) String[] takecourseScore, 
			@RequestParam(required = false) String[] takecourseWeek,
			@RequestParam(required = false) String[] takecourseTime,
			@RequestParam(required = false) String[] where, 
			@RequestParam(required = false) String[] teacher,
			Map<String, Object> m) {
		TakeCourse takecourse = new TakeCourse();
		List<Course> course = new ArrayList<Course>();
		
			Course stc = new Course();
			 stc.setUserId(Integer.parseInt(ERROR, (int) this.getLoginUserId()));
			 stc.setTakecourseId(Integer.parseInt(((String) session.getAttribute("takecourseId"))));
			 stc.setCourseName(((String) session.getAttribute("takecourseName")));
			 stc.setCourseRecord(((String) session.getAttribute("takecourseRecord")));
			 stc.setCourseScore(((String) session.getAttribute("takecourseScore")));
			 stc.setCourseWeek(((String) session.getAttribute("takecourseWeek")));
			 stc.setCourseTime(((String) session.getAttribute("takecourseTime")));
			 stc.setCourseWhere(((String) session.getAttribute("where")));
			 stc.setCourseTeacher(((String) session.getAttribute("teacher")));
			
			 course.add(stc);

		

		try {
			this.getServMgr().getCourseService().addTakeCourse(course);
			m.put("takecourseId", takecourse.getTakecourseId() + "");
			return "/addCourse1";
		} catch (Exception e) {
			e.printStackTrace();
			this.addMessage("确认选课失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}

	}*/
	/*@RequestMapping("/addSuccessTakeCourse")
	public String addSuccessTakeCourse(HttpServletRequest session,
			@RequestParam(required = false) String takecourseId,
			@RequestParam(required = false) String userId,
			@RequestParam(required = false) String takecourseName, 
			@RequestParam(required = false) String takecourseRecord,
			@RequestParam(required = false) String takecourseScore, 
			@RequestParam(required = false) String takecourseWeek,
			@RequestParam(required = false) String takecourseTime,
			@RequestParam(required = false) String where, 
			@RequestParam(required = false) String teacher,
			Map<String,Object> m){	
		
		String takecourseId1=(String)session.getAttribute("takecourseId1");
		String userId1=(String)session.getAttribute("userId1");
		String takecourseName1=(String)session.getAttribute("takecourseName1");
		String takecourseRecord1=(String)session.getAttribute("takecourseRecord1");
		String takecourseScore1=(String)session.getAttribute("takecourseScore1");
		String takecourseWeek1=(String)session.getAttribute("takecourseWeek1");
		String takecourseTime1=(String)session.getAttribute("takecourseTime1");
		String where1=(String)session.getAttribute("where1");
		String teacher1=(String)session.getAttribute("teacher1");
		List<Course> course = new ArrayList<Course>();
		
		Course stc = new Course();
		// stc.setCourseId(Integer.parseInt(takecourseId1));
		 stc.setTakecourseId(Integer.parseInt(((String) session.getAttribute("takecourseId1"))));
		 stc.setUserId(Integer.parseInt(((String) session.getAttribute("userId1"))));
		 stc.setCourseName(((String) session.getAttribute("takecourseName1")));
		 stc.setCourseRecord(((String) session.getAttribute("takecourseRecord1")));
		 stc.setCourseScore(((String) session.getAttribute("takecourseScore1")));
		 stc.setCourseWeek(((String) session.getAttribute("takecourseWeek1")));
		 stc.setCourseTime(((String) session.getAttribute("takecourseTime1")));
		 stc.setCourseWhere(((String) session.getAttribute("where1")));
		 stc.setCourseTeacher(((String) session.getAttribute("teacher1")));		
		 course.add(stc);
		try{
			this.getServMgr().getCourseService().addTakeCourse(course);
			m.put("userId", userId1);
			m.put("takecourseId", takecourseId1);
			m.put("courseName", takecourseName1);
			m.put("courseRecord", takecourseRecord1);
			m.put("courseScore", takecourseScore1);
			m.put("courseWeek", takecourseWeek1);
			m.put("courseTime", takecourseTime1);
			m.put("courseWhere", where1);
			m.put("courseTeacher", teacher1);	
			m.put("couser",course);
			return "/order/addOrder";
		}
		catch(Exception e){
			e.printStackTrace();
			this.addMessage("提交订单失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}
	}
*/
	@RequestMapping("/addSuccessTakeCourse")
	public String addSuccessTakeCourse(HttpServletRequest request,
			//@RequestParam(required = false) String sort,
			/*@RequestParam(required = false) String takecourseName, 
			@RequestParam(required = false) String takecourseRecord,
			@RequestParam(required = false) String takecourseScore, 
			@RequestParam(required = false) String takecourseWeek,
			@RequestParam(required = false) String takecourseTime,
			@RequestParam(required = false) String where, 
			@RequestParam(required = false) String teacher,*/
			Course course,
			Map<String,Object> m) {
		String takecourseId=(String)request.getAttribute("takecourseId");
		String userId=(String)request.getAttribute("userId1");
		String courseName=(String)request.getAttribute("takecourseName1");
		String courseRecord=(String)request.getAttribute("takecourseRecord1");
		String courseScore=(String)request.getAttribute("takecourseScore1");
		String courseWeek=(String)request.getAttribute("takecourseWeek1");
		String courseTime=(String)request.getAttribute("takecourseTime1");
		String courseWhere=(String)request.getAttribute("where1");
		String courseTeacher=(String)request.getAttribute("teacher1");
        List<Course> course1 = new ArrayList<Course>();
		
		Course stc = new Course();
		/*
		// stc.setCourseId(Integer.parseInt(takecourseId1));
		 stc.setTakecourseId(Integer.parseInt(((String) request.getAttribute("takecourseId"))));
		 stc.setUserId(Integer.parseInt(((String) request.getAttribute("userId"))));
		 */
		 /*stc.setCourseName(((String) request.getAttribute("takecourseName")));
		 stc.setCourseRecord(((String) request.getAttribute("takecourseRecord")));
		 stc.setCourseScore(((String) request.getAttribute("takecourseScore")));
		 stc.setCourseWeek(((String) request.getAttribute("takecourseWeek")));
		 stc.setCourseTime(((String) request.getAttribute("takecourseTime")));
		 stc.setCourseWhere(((String) request.getAttribute("where")));
		 stc.setCourseTeacher(((String) request.getAttribute("teacher")));		
		 course1.add(stc);*/
		 try{
				this.getServMgr().getCourseService().addCourse1(course);
				//this.getServMgr().getCourseService().getTakeSuccessCourse(userId, takecourseId);
				//Page<TakeCourse> takecourse = this.getServMgr().getTakeCourseService().getTakeCourse(sort);
				//m.put("takecourse", takecourse);
				m.put("userId", userId);
				m.put("takecourseId", takecourseId);
				/*m.put("courseName", courseName);
				m.put("courseRecord", courseRecord);
				m.put("courseScore", courseScore);
				m.put("courseWeek", courseWeek);
				m.put("courseTime", courseTime);
				m.put("courseWhere", courseWhere);
				m.put("courseTeacher", courseTeacher);	*/
				
				m.put("course",course);
				this.addMessage("选课成功");
				this.addRedirURL("返回", "/takecourse/getTakeCourse");
			}
			catch(Exception e){
				e.printStackTrace();
				this.addMessage("选课失败");
				this.addRedirURL("返回", "@back");
				
			}
		 return EXECUTE_RESULT;
		}

}
