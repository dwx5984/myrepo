/**
 * 
 */
package cn.sise.ssm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sise.ssm.josnmsg.Msg;
import cn.sise.ssm.po.User;
import cn.sise.ssm.service.UserService;

/**
 * @author dwx 管理员控制类
 */
@Controller
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkUsers(String name, String pwd) {
		// 数据库校验
		// System.out.println(name + " " + pwd);

		boolean hasN = userService.checkUserName(name);

		boolean hasP = userService.checkUserPwd(pwd);

		if (hasN && hasP) {
			// System.out.println(name + " " + pwd);
			return Msg.success();
		} else if (hasN && !hasP) {
			return Msg.fail().add("va_msg", "密码错误");
		} else  {
			return Msg.fail().add("va_msg", "用户不存在");
		} 
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session , String username ) {
		//在session保存信息
		session.setAttribute("username", username);
		System.out.println("setAttribute方法执行了。。。");
		//重定向
		return"index1";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//在session保存信息
		session.invalidate();
		//重定向
		return"index";
	}
}
