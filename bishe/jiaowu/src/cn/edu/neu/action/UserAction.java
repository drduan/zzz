package cn.edu.neu.action;

import java.io.File;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.LevMessage;
import cn.edu.neu.model.User;

@Controller
@RequestMapping("/user")
public class UserAction extends BaseAction {

	/**
	 * 用户登录
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Map<String, String> login(User user, HttpSession session) {
		System.out.println("userlogin:" + user);
		User dbUser = this.getServMgr().getUserService().checkStudent(user);
		// System.out.println(user.getUserName()+","+user.getPassword()+"--------"+user1);
		Map<String, String> m = new HashMap<String, String>();
		if (dbUser != null) {
			session.setAttribute(Constants.LOGIN_USER, dbUser);
			m.put("login", "yes");
		} else {
			// this.addMessage(Constants.LOGIN_ERR);
			// this.addRedirURL("返回登录页面", INDEX_PAGE);
			m.put("login", "no");
		}
		return m;
	}

	/**
	 * 用户登出
	 */
	@ResponseBody
	@RequestMapping("/logout")
	public Map<String, String> logout() throws Exception {
		getSession().invalidate();
		Map<String, String> m = new HashMap<String, String>();
		m.put("logout", "yes");
		return m;
	}

	/**
	 * 用户注册
	 */
	@ResponseBody
	@RequestMapping("/reg")
	public Map<String, String> reg(HttpServletRequest request,User user) throws Exception {
		
		System.out.println(user);
		boolean f = this.getServMgr().getUserService().regStudent(user);
		Map<String, String> m = new HashMap<String, String>();
		if (f)
			m.put("reg", "yes");
		else
			m.put("reg", "no");
		return m;
	}

	/**
	 * 检查用户是否重复
	 */
	@ResponseBody
	@RequestMapping("/checkStudentName")
	public Map<String, Boolean> checkStudentName(@RequestParam String userName) throws Exception {
		// boolean ifavailable=true;
		Map<String, Boolean> m = new HashMap<String, Boolean>();
		m.put("available", this.getServMgr().getUserService().checkStudentName(userName));
		return m;
	}
	
	/**
	 * 管理员登录
	 */
	@ResponseBody
	@RequestMapping("/adminlogin")
	public Map<String, String> adminlogin(User user, HttpSession session) {
		System.out.println("--------" + user);
		User dbUser = this.getServMgr().getUserService().checkAdmin(user);
		//System.out.println(user.getUserName()+","+user.getUserPass()+"--------"+user);
		Map<String, String> m = new HashMap<String, String>();
		if (dbUser != null) {
			session.setAttribute(Constants.LOGIN_USER, dbUser);
			m.put("login", "yes");
		} else {
			// this.addMessage(Constants.LOGIN_ERR);
			// this.addRedirURL("返回登录页面", INDEX_PAGE);
			m.put("login", "no");
		}
		return m;
	}
	


	/**
	 * 添加用户
	 */
	@ResponseBody
	@RequestMapping("/addStudent")
	public String addStudent(User user, HttpSession session,
			Map<String, String> m) {
		User user1 = new User();
		user1.setUserId(this.getLoginUserId());

		List<User> userDetails = new ArrayList<User>();
		for (int j = 0; j < ((String[]) session.getAttribute("userId")).length; j++) {
			User s = new User();
			s.setUserName(((String[]) session.getAttribute("userName"))[j]);
			s.setUserPass(((String[]) session.getAttribute("userPass"))[j]);
			s.setUserRecord(((String[]) session.getAttribute("userRecord"))[j]);
			s.setUserPhone(((String[]) session.getAttribute("userPhone"))[j]);
			s.setUserBrithday(((String[]) session.getAttribute("userBrithday"))[j]);
			s.setUserTime(((String[]) session.getAttribute("userTime"))[j]);
			userDetails.add(s);

		}

		try {
			this.getServMgr().getUserService().addStudent(user);
			m.put("userId", user.getUserId() + "");
			return "/student/addStudent";
		} catch (Exception e) {
			e.printStackTrace();
			this.addMessage("提交订单失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}

	}
	
	/**
	 * 查找用户
	 */
	@ResponseBody
	@RequestMapping("/getAll")
	public String getAll( Map<String, Page<User>> m) {
		Page<User> user = this.getServMgr().getUserService().findAll();
		m.put("user", user);
		return "/student/manage_student";
	}
	
	@ResponseBody
	@RequestMapping("/deleteStudent")
	public Map<String, Object> deleteStudent(@RequestParam String userId) {
		Map<String, Object> m = new HashMap<String, Object>();
		try {
			this.getServMgr().getUserService().deleteStudent(userId);
			m.put("delete","yes" );
		} catch (Exception e) {
			e.printStackTrace();
			m.put("delete", "no");
		}
		return m;
	}
	
	@ResponseBody
	@RequestMapping("/editStudent")
	public String editStudent(User user, HttpSession session,
			Map<String, String> m) {
		User user1 = new User();
		user1.setUserId(this.getLoginUserId());

		List<User> userDetails = new ArrayList<User>();
		for (int j = 0; j < ((String[]) session.getAttribute("userId")).length; j++) {
			User s = new User();
			s.setUserName(((String[]) session.getAttribute("userName"))[j]);
			s.setUserPass(((String[]) session.getAttribute("userPass"))[j]);
			s.setUserRecord(((String[]) session.getAttribute("userRecord"))[j]);
			s.setUserPhone(((String[]) session.getAttribute("userPhone"))[j]);
			s.setUserBrithday(((String[]) session.getAttribute("userBrithday"))[j]);
			s.setUserTime(((String[]) session.getAttribute("userTime"))[j]);
			userDetails.add(s);

		}

		try {
			this.getServMgr().getUserService().addStudent(user);
			m.put("userId", user.getUserId() + "");
			return "/student/editStudent";
		} catch (Exception e) {
			e.printStackTrace();
			this.addMessage("修改订单失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}

	}
	
	@ResponseBody
	@RequestMapping("/addlevMessage")
	private Map<Object, Object> addlevMessage(LevMessage levMessage) {
		Map<Object, Object> map = new HashMap<>();
		map.put("flag", this.getServMgr().getLevMessageService().addLevMessage(levMessage));
		return map;
	}
}
