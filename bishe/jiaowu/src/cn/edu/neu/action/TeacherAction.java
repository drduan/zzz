package cn.edu.neu.action;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.model.Teacher;

@Controller
@RequestMapping("/admin/teacher")
public class TeacherAction extends BaseAction {

	@RequestMapping("/getAdminTeacher")
	public String getAdminTeacher(@RequestParam(required = false) String teacherName, Map<String, Object> m) {

		Page<Teacher> teacher = this.getServMgr().getTeacherService().getAdminSearchTeacher(teacherName);
		m.put("teacher", teacher);
		return "/admin/teacher/teacherList";
	}

	@RequestMapping("handleTeacher")
	public String handleTeacher(@RequestParam(required = false) String teacherId, Map<String, Object> m) {
		if (teacherId != null && !teacherId.equals("")) {
			Teacher teacher = this.getServMgr().getTeacherService().getTeacherById(teacherId);
			m.put("teacher", teacher);
		}
		return "/admin/teacher/handleTeacher";
	}

	@RequestMapping("/doHandleTeacher")
	public String dohandleTeacher(HttpServletRequest request, Teacher teacher) {
		if (teacher.getTeacherId() == 0) {
			this.getServMgr().getTeacherService().addTeacher(teacher);
			this.addMessage("添加教师成功");
			this.addRedirURL("返回", "/admin/teacher/getAdminTeacher");
		} else {
			this.getServMgr().getTeacherService().updateTeacher(teacher);
			this.addMessage("操作教师成功");
			this.addRedirURL("返回", "/admin/teacher/getAdminTeacher");

		}
		return EXECUTE_RESULT;
	}

	@RequestMapping("/delTeacher")
	public String delTeacher(@RequestParam String teacherId) {
		this.getServMgr().getTeacherService().deleteTeacher(teacherId);
		this.addMessage("删除教师成功");
		this.addRedirURL("返回", "/admin/teacher/getAdminTeacher");
		return EXECUTE_RESULT;

	}

	// 批量删除
	@RequestMapping("/delTeacherByIds")
	public String delTeacherByIds(@RequestParam String[] teacherIds, HttpServletRequest request) {
		try {
			for (int i = 0; i < teacherIds.length; i++) {

			}
			this.getServMgr().getTeacherService().delTeacherByIds(teacherIds);
			this.addMessage("教师删除成功");
			this.addRedirURL("返回", "/admin/teacher/getAdminTeacher");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.addMessage("教师删除失败");
			this.addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

}