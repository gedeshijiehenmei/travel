package com.travel.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.travel.bean.Msg;
import com.travel.bean.Product;
import com.travel.bean.UserInfo;
import com.travel.service.ProductService;
import com.travel.service.SystemService;
import com.travel.service.UserInfoService;
import com.travel.service.WebService;

@Controller
@RequestMapping("/system")
public class SystemController {
	@Autowired
	SystemService systemService;
	// 登录页面
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	// 校验管理员登录
	@RequestMapping("/inspect_login")
	@ResponseBody
	public Msg adminLogin(HttpServletRequest request, String userName, String password) {
		UserInfo userInfo = new UserInfo();
		userInfo.setUserName(userName);
		userInfo.setPassword(password);
		UserInfo userInfos = systemService.selectUser(userInfo);
		request.getSession().setAttribute("userInfo", userInfos);
		if (userInfos != null) {
			return Msg.success().add("userInfo", userInfos);
		} else {
			return Msg.fail("用户名或者密码错误");

		}

	}


	/*@RequestMapping("/admin/index")
	public String adminindex() {
		return "admin/index";

	}*/

	// 跳转到游客注册页面
	@RequestMapping("/register")
	public String userRegister() {

		return "register";

	}

	// 注册功能，把用户所注册的信息保存到后台
	@RequestMapping("/save_register")
	@ResponseBody
	public Msg saveUserRegister(String userName, String name, String phone, String password) {
		UserInfo userInfo = new UserInfo();
		UserInfo user=systemService.findUserName(userName);
		if(user!=null) {
			return Msg.fail("用户昵称已经存在，请换一个昵称注册");
		}else {
		userInfo.setUserName(userName);
		userInfo.setName(name);
		userInfo.setPhone(phone);
		userInfo.setPassword(password);
		userInfo.setCreationTime(new Date());
		int count = systemService.saveUserRegister(userInfo);
		if (count != 0) {
			return Msg.success();
		} else {
			return Msg.fail("注册失败，请重新注册");
		}
	}
	}
	// 退出登录
	@RequestMapping("/login_out")
	public String loginOut(HttpSession session) {
		// 销毁session
		session.invalidate();

		return "login";
	}



}
