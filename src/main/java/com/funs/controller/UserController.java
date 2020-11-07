package com.funs.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.funs.domain.Msg;
import com.funs.domain.User;
import com.funs.service.UserService;


@SessionAttributes(value="LoginUser",types={String.class})
@Controller
public class UserController {

	@Autowired
	UserService userService;


	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.invalidate();
		return "login";
	}

	@RequestMapping(value="/handle_login",method = RequestMethod.POST)
	@ResponseBody
	public Msg loginAction(User user,Map<String,Object> map) {
		String username_input=user.getUsername();
		String password_input=user.getPassword();
		//System.out.println(username_input);
		//System.out.println(password_input);
		String password=userService.getPassword(username_input);
		//System.out.println(password);
		if (password!=null) {
			// 用户名正确，继续判断密码是否正确
			if (password.equals(password_input)) {
				//登陆成功，将用户名存储到session
				map.put("LoginUser", username_input);	 
				//System.out.println("success");
				return Msg.success();
			} else {
				// 密码错误
				//System.out.println("password error");
				return Msg.fail().add("error", "0");
			}
		} else {
			// 用户名错误
			//System.out.println("username error");
			return Msg.fail().add("error", "1");
		}
	}

	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/handle_reg",method = RequestMethod.POST)
	@ResponseBody
	public Msg regAction(User user) {
		String regexName="^[a-zA-Z0-9_]{4,15}$";
		String regexPassword="^[a-zA-Z0-9_]{4,15}$";
		String username_input=user.getUsername();
		String password_input=user.getPassword();
		System.out.println(username_input);
		System.out.println(password_input);
		String password=userService.getPassword(username_input);
		//System.out.println(password);
		if (password!=null) {
			return Msg.fail().add("error", 2);
		}else { 
			if (username_input.matches(regexName)) {
				if(password_input.matches(regexPassword)) {
					//用户名和密码都验证正确
					System.out.println("用户名和密码都验证正确");
					userService.addUser(user);
					return Msg.success();
				}
				else {
					System.out.println("密码格式错误");
					//密码格式错误
					return Msg.fail().add("error", 0);
				}
			}else {
				//用户名格式错误
				System.out.println("用户名格式错误");
				return Msg.fail().add("error", 1);
			}
		}
	}
}
