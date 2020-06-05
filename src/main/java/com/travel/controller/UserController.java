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
import com.travel.service.UserInfoService;
import com.travel.service.WebService;

@Controller
@RequestMapping("/userInfo")
public class UserController {
	@Autowired
	UserInfoService userInfoService;

//跳转到查询所有的用户信息页面
	@RequestMapping("/userInfo_list")
	public String UserInfoList() {
		return "admin/backstage/userInfo/userInfo_list";// WEB-INF/admin/backstage/userInfo/userInfo_list.jsp
	}

//跳转到添加的用户信息页面
	@RequestMapping("/userInfo_add")
	public String UserInfoAdd() {

		return "admin/backstage/userInfo/userInfo_add";// WEB-INF/admin/backstage/userInfo/userInfo_add.jsp
	}

	// 跳转到查询所有的导游信息页面
	@RequestMapping("/guideInfo_list")
	public String guideInfoList() {
		return "admin/backstage/guideInfo/guideInfo_list";// WEB-INF/admin/backstage/userInfo/userInfo_list.jsp
	}

	// 跳转到添加的导游信息页面
	@RequestMapping("/guideInfo_add")
	public String guideInfoAdd() {

		return "admin/backstage/guideInfo/guideInfo_add";// WEB-INF/admin/backstage/userInfo/userInfo_add.jsp
	}

//	弹出修改用户信息模态框
	@RequestMapping("/userInfo_edit")
	public String editUI() {
		return "admin/backstage/userInfo/userInfo_edit";// WEB-INF/pages/product/project_edit.jsp
	}

	// 查询用户信息并分页显示
	@RequestMapping("/userInfo")
	@ResponseBody
	public Msg getEmpsWithjson(@RequestParam(value = "pageCurrent", defaultValue = "1") Integer pageCurrent,
			String userName, String state, String role) {
		// 设计分页参数
		PageHelper.startPage(pageCurrent, 6);
		UserInfo userInfo = new UserInfo();
		userInfo.setUserName(userName);
		userInfo.setState(state);
		userInfo.setRole(role);
		List<UserInfo> userinfo = userInfoService.getAllUserInfo(userInfo);
		// 使用pageinfo封装查询结果
		PageInfo page = new PageInfo(userinfo, 6);
		return Msg.success().add("pageObject", page);
	}

	// 用户的启用和禁用
	@RequestMapping("/doValidById")
	@ResponseBody
	public Msg doStateById(String checkedIds, String valid) {
		UserInfo userInfo = new UserInfo();
		userInfo.setId(Integer.parseInt(checkedIds));
		userInfo.setState(valid);
		userInfoService.doStateById(userInfo);
		return Msg.success();
	}

	// 检验用户名是否可用
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuser(@RequestParam("userName") String userName) {
		boolean b = userInfoService.checkuser(userName);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail("用户名不可用");
		}
	}

	/**
	 * 根据id查询游客信息
	 * 
	 */
	@RequestMapping("/doFindUserInfoById")
	@ResponseBody
	public Msg findUserId(Integer id) {
		UserInfo userInfo = userInfoService.findUserId(id);
		return Msg.success().add("userInfo", userInfo);

	}

	/* 游客信息修改 */
	@RequestMapping("/doUpdateUserInfo")
	@ResponseBody
	public Msg updateUserInfo(UserInfo userInfo, HttpServletRequest request) {
		userInfoService.updateUserInfo(userInfo);
		return Msg.success();
	}

	// 添加用户信息
	@RequestMapping(value = "/doSaveUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public Msg doSaveUserInfo(@RequestParam("photo") MultipartFile photo, HttpSession session, Model model,
			HttpServletRequest request, String userName, String password, String name, String gender, String birthday,
			String phone, String state, String mailbox, String address, String role)
			throws IllegalStateException, IOException {
		UserInfo userInfo = new UserInfo();
		String originalFilename = photo.getOriginalFilename();
		if (photo != null && originalFilename != null && originalFilename.length() > 0) {
			String pic_path = "F:\\upload";
			String newFileName = UUID.randomUUID() + originalFilename;
			File newFile = new File(pic_path, newFileName);
			photo.transferTo(newFile);
			userInfo.setPhoto(newFileName);
		}
		userInfo.setUserName(userName);
		userInfo.setPassword(password);
		userInfo.setName(name);
		userInfo.setGender(gender);
		userInfo.setBirthday(birthday);
		userInfo.setPhone(phone);
		userInfo.setState(state);
		userInfo.setMailbox(mailbox);
		userInfo.setRole(role);
		userInfo.setAddress(address);
		userInfo.setCreationTime(new Date());
		int count = userInfoService.doSaveUserInfo(userInfo);
		if (count != 0) {
			return Msg.success();
		} else {
			return Msg.fail("添加失败");
		}
	}

	// 根据id删除游客信息
	@RequestMapping(value = "/deleteuserInfoByid/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteuserInfoByid(@PathVariable("id") Integer id) {
		userInfoService.deleteuserInfoByid(id);
		return Msg.success();
	}

	// 管理员修改密码
	@Autowired
	WebService webService;

	@RequestMapping(value = "/change_password", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateUserPwd(String id, String oldPassword, String newPassword) {
		UserInfo userInfo = new UserInfo();
		userInfo.setId(Integer.parseInt(id));
		userInfo.setPassword(oldPassword);
		UserInfo checkUser = webService.checkOldPwd(userInfo);
		if (checkUser != null) {
			UserInfo newUserInfo = new UserInfo();
			newUserInfo.setId(Integer.parseInt(id));
			newUserInfo.setPassword(newPassword);
			int count = webService.updateUserPwd(newUserInfo);
			if (count != 0) {
				return Msg.success();
			} else {
				return Msg.fail("修改失败");
			}
		} else {
			return Msg.fail("*原密码输入有误，请重新输入");
		}
	}

}
