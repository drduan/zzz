package cn.edu.neu.action;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Course;
import cn.edu.neu.model.LevMessage;
import cn.edu.neu.model.User;

@Controller
@RequestMapping("/admin/user")
public class AdminUserAction extends BaseAction {

	@RequestMapping("/getAdminStudent")
	public String getAdminStudent(@RequestParam(required = false) String userName, Map<String, Object> m) {
		Page<User> user = this.getServMgr().getUserService().getAdminSearchStudent(userName);
		m.put("user", user);
		return "/admin/student/studentList";
	}

	@RequestMapping("handleStudent")
	public String handleStudent(@RequestParam(required = false) String userId, Map<String, Object> m) {
		if (userId != null && !userId.equals("")) {
			User user = this.getServMgr().getUserService().findById(userId);
			m.put("user", user);
		}
		return "/admin/student/handleStudent";
	}

	@RequestMapping("/doHandleStudent")
	public String dohandleStudent(HttpServletRequest request, User user) {
		System.out.println("user:" + user);
		String oldpicpath = user.getUserPic();
		String userpicpath = "";
		if (user.getUserPicFile() != null) {
			if (user.getUserPicFile().getContentType().equals("image/jpeg")
					|| user.getUserPicFile().getContentType().equals("image/png")) {

				String oriFilename = user.getUserPicFile().getOriginalFilename();
				String extFilename = oriFilename.substring(oriFilename.indexOf("."), oriFilename.length());
				System.out.println("ext:" + extFilename);
				userpicpath = "/images/pic/" + Calendar.getInstance().getTimeInMillis() + extFilename;
				user.setUserPic(userpicpath);

				String path = request.getServletContext().getRealPath(userpicpath);
				File file = new File(path);
				try {
					if (user.getUserPicFile() != null) {
						if (user.getUserId() != 0) {
							File f = new File(request.getServletContext().getRealPath(oldpicpath));
							f.delete();
						}
						user.getUserPicFile().transferTo(file);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					this.addMessage("图片上传失败");
					this.addRedirURL("返回", "@back");
				}
			} else {
				this.addMessage("上传图片类型不正确，请上传jpg或png格式图片");
				this.addRedirURL("返回", "@back");
				return EXECUTE_RESULT;
			}
		}

		if (user.getUserId() == 0) {
			this.getServMgr().getUserService().addStudent(user);
			this.addMessage("添加学生用户成功");
			this.addRedirURL("返回", "/admin/user/getAdminStudent");
		} else {
			this.getServMgr().getUserService().updateStudent(user);
			this.addMessage("操作学生用户成功");
			this.addRedirURL("返回", "/admin/user/getAdminStudent");
		}
		return EXECUTE_RESULT;
	}

	@RequestMapping("/delStudent")
	public String delStudent(@RequestParam String userId) {
		this.getServMgr().getUserService().deleteStudent(userId);
		this.addMessage("删除用户成功");
		this.addRedirURL("返回", "/admin/user/getAdminStudent");
		return EXECUTE_RESULT;

	}

	// 批量删除
	@RequestMapping("/delStudentByIds")
	public String delStudentByIds(@RequestParam String[] userIds, HttpServletRequest request) {
		try {
			for (int i = 0; i < userIds.length; i++) {

			}
			this.getServMgr().getUserService().delUserByIds(userIds);
			this.addMessage("学生用户删除成功");
			this.addRedirURL("返回", "/admin/user/getAdminStudent");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.addMessage("学生用户删除失败");
			this.addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/queryLevMessage")
	public String queryLevMessage(Model model) {
		model.addAttribute("_LEVMESSAGE_",this.getServMgr().getLevMessageService().queryLevMessage());
		return "/admin/levmessage/levmessage";
	}
	
	@ResponseBody
	@RequestMapping("/readLevMG")
	public Map<Object, Object> readLevMG(LevMessage levMessage){
		Map<Object, Object> map=new HashMap<>();
		map.put("flag", this.getServMgr().getLevMessageService().readLevMessage(levMessage));
		map.put("list", this.getServMgr().getLevMessageService().queryLevMessage());
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/delLevMG")
	public Map<Object, Object> delLevMG(LevMessage levMessage){
		Map<Object, Object> map=new HashMap<>();
		map.put("flag", this.getServMgr().getLevMessageService().deleteLevMessage(levMessage));
		map.put("list", this.getServMgr().getLevMessageService().queryLevMessage());
		return map;
	}

}
