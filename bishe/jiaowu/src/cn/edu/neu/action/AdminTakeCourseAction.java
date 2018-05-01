package cn.edu.neu.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.core.util.Email;
import cn.edu.neu.core.util.ReadExceTool;
import cn.edu.neu.model.StudentScore;
import cn.edu.neu.model.TakeCourse;
import cn.edu.neu.model.Teacher;

@Controller
@RequestMapping("/admin/takecourse")
public class AdminTakeCourseAction extends BaseAction {

	@RequestMapping("/getAdminTakeCourse")
	public String getAdminTakeCourse(@RequestParam(required = false) String takecourseName, Map<String, Object> m) {
		Page<TakeCourse> takecourse = this.getServMgr().getTakeCourseService().getAdminSearchTakeCourse(takecourseName);
		m.put("takecourse", takecourse);
		// System.out.println(takecourse);
		return "/admin/takecourse/takecourseList";
	}

	@RequestMapping("/updateScore")
	public String updateScore(@RequestParam(required = false) MultipartFile excel, String ksbm, Boolean notify,
			Map<String, Object> m) {
		System.out.println(excel.getName());

		ReadExceTool tool = new ReadExceTool();
		try {
			String[] sts = tool.readExcelTitle(excel.getInputStream(), excel.getOriginalFilename());
			Map<Integer, String> map = tool.readExcelContent(excel.getInputStream(), excel.getOriginalFilename());

			for (Integer i : map.keySet()) {
				if (i == 0) {
					continue;
				}
				System.out.println(i + map.get(i));

				String string = map.get(i);
				String[] strings = string.split("    ");
				log.debug(strings.length);
				StudentScore score = new StudentScore();

				score.setSbm(ksbm);
				score.setSname(strings[0]);
				score.setSno(strings[1]);
				score.setS_score(new BigDecimal(strings[2]));
				score.setLrname(strings[3]);
				System.out.println(score.toString());
				this.getServMgr().getTakeCourseService().saveScore(score);
			}

			if (notify) {
//			for(	Email email:) {
//				
//			}
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Page<TakeCourse> takecourse =
		// this.getServMgr().getTakeCourseService().getAdminSearchTakeCourse(takecourseName);
		// m.put("takecourse", takecourse);
		// System.out.println(takecourse);
		this.addMessage("操作录入成绩成功");
		this.addRedirURL("返回", "/admin/takecourse/updateScoreView");
		return EXECUTE_RESULT;

	}

	@RequestMapping("/updateScoreView")
	public String updateScore(Map<String, Object> m) {
		// Page<TakeCourse> takecourse =
		// this.getServMgr().getTakeCourseService().getAdminSearchTakeCourse(takecourseName);
		// m.put("takecourse", takecourse);
		// System.out.println(takecourse);

		return "/admin/takecourse/updateScoreView";
	}

	@RequestMapping("handleTakeCourse")
	public String handleTakeCourse(@RequestParam(required = false) String takecourseId, Map<String, Object> m) {
		if (takecourseId != null && !takecourseId.equals("")) {
			TakeCourse takecourse = this.getServMgr().getTakeCourseService().getTakeCourseById(takecourseId);
			m.put("takecourse", takecourse);
		}
		return "/admin/takecourse/handleTakeCourse";
	}

	@RequestMapping("/doHandleTakeCourse")
	public String dohandleTakeCourse(HttpServletRequest request, TakeCourse takecourse) {
		if (takecourse.getTakecourseId() == 0) {
			this.getServMgr().getTakeCourseService().addTakeCourse(takecourse);
			this.addMessage("添加选课课程成功");
			this.addRedirURL("返回", "/admin/takecourse/getAdminTakeCourse");
		} else {
			this.getServMgr().getTakeCourseService().updateTakeCourse(takecourse);
			this.addMessage("操作选课课程成功");
			this.addRedirURL("返回", "/admin/takecourse/getAdminTakeCourse");

		}
		return EXECUTE_RESULT;
	}

	@RequestMapping("/delTakeCourse")
	public String delTakeCourse(@RequestParam String takecourseId) {
		this.getServMgr().getTakeCourseService().deleteTakeCourse(takecourseId);
		this.addMessage("删除选课课程成功");
		this.addRedirURL("返回", "/admin/takecourse/getAdminTakeCourse");
		return EXECUTE_RESULT;

	}

	// 批量删除
	@RequestMapping("/delTakeCourseByIds")
	public String delTakeCourseByIds(@RequestParam String[] takecourseIds, HttpServletRequest request) {
		try {
			for (int i = 0; i < takecourseIds.length; i++) {

			}
			this.getServMgr().getTakeCourseService().delTakeCourseByIds(takecourseIds);
			this.addMessage("学生课程删除成功");
			this.addRedirURL("返回", "/admin/takecourse/getAdminTakeCourse");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.addMessage("学生课程删除失败");
			this.addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	@RequestMapping("/handleCourseTeacher")
	public String handleTakeCourseTeacher(@RequestParam String takecourseId, Map<String, Object> m) {
		TakeCourse takecourseTeacher = this.getServMgr().getTakeCourseService().getTakeCourseTeacherById(takecourseId);
		List<Teacher> teacher = this.getServMgr().getTeacherService().getAllCourseTeacherWithoutPage();
		// System.out.println("sizes:"+sizes);
		// System.out.println("goodsSizes:"+goodsSizes.getSizes());
		teacher.removeAll(takecourseTeacher.getTeacher());
		m.put("takecourseTeacher", takecourseTeacher);
		m.put("teacher", teacher);
		m.put("takecourseId", takecourseId);
		return "/admin/takecourse/handleCourseTeacher";
	}

	@RequestMapping("/doHandleCourseTeacher")
	public String doHandleCourseTeacher(@RequestParam String takecourseId, @RequestParam String[] teacherIds) {
		try {
			String[] nowIds = this.getServMgr().getTakeCourseService().getTakeCourseTeacherIds(takecourseId);
			List<String> retainIdsList = new ArrayList<String>(Arrays.asList(teacherIds));
			List<String> nowIdsList = new ArrayList<String>(Arrays.asList(nowIds));
			List<String> insertIdsList = new ArrayList<String>(Arrays.asList(teacherIds));
			System.out.println(insertIdsList);
			System.out.println(nowIdsList);
			retainIdsList.retainAll(nowIdsList);
			System.out.println(retainIdsList);

			insertIdsList.removeAll(retainIdsList);
			nowIdsList.removeAll(retainIdsList);
			System.out.println(insertIdsList);
			System.out.println(nowIdsList);

			this.getServMgr().getTakeCourseService().updateTakeCourseTeacherById(takecourseId, insertIdsList,
					nowIdsList);
			this.addMessage("选课教师教室更新成功");
			this.addRedirURL("返回", "/admin/takecourse/handleTakeCourseTeacher?takecourseId=" + takecourseId);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.addMessage("选课教师教室更新失败");
			this.addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

}
