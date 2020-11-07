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
			// �û�����ȷ�������ж������Ƿ���ȷ
			if (password.equals(password_input)) {
				//��½�ɹ������û����洢��session
				map.put("LoginUser", username_input);	 
				//System.out.println("success");
				return Msg.success();
			} else {
				// �������
				//System.out.println("password error");
				return Msg.fail().add("error", "0");
			}
		} else {
			// �û�������
			//System.out.println("username error");
			return Msg.fail().add("error", "1");
		}
	}

	/**
	 * ע��
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
					//�û��������붼��֤��ȷ
					System.out.println("�û��������붼��֤��ȷ");
					userService.addUser(user);
					return Msg.success();
				}
				else {
					System.out.println("�����ʽ����");
					//�����ʽ����
					return Msg.fail().add("error", 0);
				}
			}else {
				//�û�����ʽ����
				System.out.println("�û�����ʽ����");
				return Msg.fail().add("error", 1);
			}
		}
	}
}
