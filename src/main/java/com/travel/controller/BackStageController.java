package com.travel.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.bean.CommentInfo;
import com.travel.bean.ItineraryRouteInfo;
import com.travel.bean.Msg;
import com.travel.bean.NewsInfo;
import com.travel.bean.Order;
import com.travel.bean.ScenicSpotInfo;
import com.travel.bean.ScenicSpotTypesInfo;
import com.travel.bean.TravelsInfo;
import com.travel.bean.UserInfo;
import com.travel.service.BackStageService;
import com.travel.service.UserInfoService;
import com.travel.service.WebService;

@Controller
@RequestMapping("/backStage")
public class BackStageController {
	@Autowired
	BackStageService backStageService;
	// 登录成功后进入到后台首页
		@RequestMapping("/index")
		public String index() {
			return "admin/backstage/index";

		}
	// 跳转到查询所有的景点信息页面
	@RequestMapping("/index_list")
	public String indexList() {

		return "admin/backstage/index/index_list";// WEB-INF/admin/backstage/userInfo/userInfo_list.jsp
	}

	// 跳转到查询所有的景点信息页面
	@RequestMapping("/scenicSpot_list")
	public String scenicSpot_list() {

		return "admin/backstage/scenicSpot/scenicSpotInfo_list";// WEB-INF/admin/backstage/userInfo/userInfo_list.jsp
	}

	// 跳转到添加的景点信息页面
	@RequestMapping("/scenicSpot_add")
	public String scenicSpot_add() {

		return "admin/backstage/scenicSpot/scenicSpotInfo_add";// WEB-INF/admin/backstage/userInfo/userInfo_add.jsp
	}

	// 跳转到查询所有的订单信息页面
	@RequestMapping("/dindan_list")
	public String dindanoList() {

		return "admin/backstage/dindan/dindan_list";// WEB-INF/admin/backstage/dindan/dindan_list.jsp
	}

	// 跳转到添加的订单信息页面
	@RequestMapping("/dindan_add")
	public String dindanInfoAdd() {

		return "admin/backstage/dindan/dindan_add";// WEB-INF/admin/backstage/dindan/dindan_add.jsp
	}

//	弹出修改d订单信息模态框
	@RequestMapping("/dindanInfo_edit")
	public String dindanInfo_edit() {
		return "admin/backstage/dindan/dindan_edit";// WEB-INF/pages/product/project_edit.jsp
	}

	// 跳转到评论信息页面
	@RequestMapping("/comment_list")
	public String commentList() {
		return "admin/backstage/comment/comment_list";// WEB-INF/admin/backstage/dindan/comment_list.jsp
	}

	// 添加景点
	@RequestMapping(value = "/addScenicSpotInfo", method = RequestMethod.POST)
	@ResponseBody
	public Msg addScenicSpotInfo(@RequestParam("photo") MultipartFile photo, HttpSession session,
			HttpServletRequest request, Model model, String type, String name, String introduction, String city,
			String day, String ticket) throws IllegalStateException, IOException {
		String originalFilename = photo.getOriginalFilename();
		ScenicSpotInfo scenicSpotInfo = new ScenicSpotInfo();
		if (photo != null && originalFilename != null && originalFilename.length() > 0) {
			String pic_path = "F:\\upload";
			String newFileName = UUID.randomUUID() + originalFilename;
			File newFile = new File(pic_path, newFileName);
			photo.transferTo(newFile);
			scenicSpotInfo.setPhoto(newFileName);
		}
		scenicSpotInfo.setType(type);
		scenicSpotInfo.setName(name);
		scenicSpotInfo.setIntroduction(introduction);
		scenicSpotInfo.setCity(city);
		scenicSpotInfo.setTicket(ticket);
		scenicSpotInfo.setDay(day);
		int count = backStageService.addScenicSpotInfo(scenicSpotInfo);
		if (count != 0) {
			return Msg.success();
		} else {
			return Msg.fail("添加失败");
		}
	}

	//根据线路名称查询线路id
	@RequestMapping("/findScenicSpotName")
	@ResponseBody
	public Msg findScenicSpotName(String scenicSpotName) {
		ScenicSpotInfo scenicSpotId=backStageService.findScenicSpotName(scenicSpotName);
		
		return Msg.success().add("scenicSpotId", scenicSpotId);
	}
	// 添加景点的详细信息
	@RequestMapping(value = "/addScenicSpotInfoDetail", method = RequestMethod.POST)
	@ResponseBody
	public Msg addScenicSpotInfoDetail(@RequestParam("photo2") MultipartFile photo2, @RequestParam("photo3") MultipartFile photo3,HttpSession session,
			HttpServletRequest request, Model model,String scenicSpotid, String days, String title, String introduce) throws IllegalStateException, IOException {
		ItineraryRouteInfo itineraryRouteInfo = new ItineraryRouteInfo();
		String originalFilename = photo2.getOriginalFilename();
		if (photo2 != null && originalFilename != null && originalFilename.length() > 0) {
			String pic_path = "F:\\upload";
			String newFileName = UUID.randomUUID() + originalFilename;
			File newFile = new File(pic_path, newFileName);
			photo2.transferTo(newFile);
			itineraryRouteInfo.setPhoto(newFileName);
		}
		String originalFilename3 = photo3.getOriginalFilename();
		if (photo3 != null && originalFilename3 != null && originalFilename3.length() > 0) {
			String pic_path = "F:\\upload";
			String newFileName = UUID.randomUUID() + originalFilename3;
			File newFile = new File(pic_path, newFileName);
			photo3.transferTo(newFile);
			itineraryRouteInfo.setPhoto2(newFileName);
		}
		itineraryRouteInfo.setScenicSpotid(scenicSpotid);
		itineraryRouteInfo.setDays(days);
		itineraryRouteInfo.setTitle(title);
		itineraryRouteInfo.setIntroduce(introduce);
		int count = backStageService.addScenicSpotInfoDetail(itineraryRouteInfo);
		if (count != 0) {
			return Msg.success();
		} else {
			return Msg.fail("添加失败");
		}
	}
	// 根据编号删除线路信息
		@RequestMapping(value = "/deletescenicSpotInfoByid/{id}", method = RequestMethod.DELETE)
		@ResponseBody
		public Msg deletescenicSpotInfoByid(@PathVariable("id") Integer id) {
			backStageService.deletescenicSpotInfoByid(id);
			return Msg.success();

		}
	// 查询所有的景点信息
	// 查询景点信息并分页显示
	@RequestMapping("/scenicSpotInfo")
	@ResponseBody
	public Msg getEmpsWithjson(@RequestParam(value = "pageCurrent", defaultValue = "1") Integer pageCurrent,
			String name) {
		// 设计分页参数
		PageHelper.startPage(pageCurrent, 5);
		ScenicSpotInfo scenicSpotInfo = new ScenicSpotInfo();
		scenicSpotInfo.setName(name);
		List<ScenicSpotInfo> scenicSpot = backStageService.scenicSpotInfo(scenicSpotInfo);
		// 使用pageinfo封装查询结果
		PageInfo page = new PageInfo(scenicSpot, 5);
		return Msg.success().add("pageObject", page);
	}

	// 订单展示查询
	@RequestMapping("/dindanInfo")
	@ResponseBody
	public Msg dindanInfoList(@RequestParam(value = "pageCurrent", defaultValue = "1") Integer pageCurrent,
			String userName, String state) {
		Order order = new Order();
		order.setUserName(userName);
		order.setState(state);
		PageHelper.startPage(pageCurrent, 5);
		List<Order> orderList = backStageService.dindanInfoList(order);
		PageInfo page = new PageInfo(orderList, 5);
		return Msg.success().add("pageObject", page);

	}

	// 根据订单编号显示订单信息
	@RequestMapping("/doFindDindanInfoById")
	@ResponseBody
	public Msg findDindanId(Integer id) {
		Order dindanInfo = backStageService.doFindDindanInfoById(id);
		return Msg.success().add("dindanInfo", dindanInfo);

	}

	// 管理员修改订单信息
	@RequestMapping("/doUpdateDindanInfo")
	@ResponseBody
	public Msg dindanInfoEdit(Order order, HttpServletRequest request) {
			UserInfo loginedalumni = (UserInfo) request.getSession().getAttribute("userInfo");
			order.setDaoyou(loginedalumni.getName());
		backStageService.doUpdateDindanInfo(order);
		return Msg.success();
	}
	// 根据订单编号删除订单信息
	@RequestMapping(value = "/deleteDindanInfoByid/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteDindanInfoByid(@PathVariable("id") Integer id) {
		backStageService.deleteDindanInfoByid(id);
		return Msg.success();

	}

	// 评论展示查询
	@RequestMapping("/commentInfo")
	@ResponseBody
	public Msg commentInfoList(@RequestParam(value = "pageCurrent", defaultValue = "1") Integer pageCurrent,
			String scenicSpotName) {
		CommentInfo commentInfo = new CommentInfo();
		commentInfo.setScenicSpotName(scenicSpotName);
		PageHelper.startPage(pageCurrent, 5);
		List<CommentInfo> commentList = backStageService.commentInfoList(commentInfo);
		PageInfo page = new PageInfo(commentList, 5);
		return Msg.success().add("pageObject", page);
	}

	// 根据评论编号删除评论信息
	@RequestMapping(value = "/deleteCommentInfoByid/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteCommentInfoByid(@PathVariable("id") Integer id) {
		backStageService.deleteCommentInfoByid(id);
		return Msg.success();

	}

	// 总营业额
	@RequestMapping(value = "/turnoverTotal", method = RequestMethod.POST)
	@ResponseBody
	public Msg turnoverTotal() {
		List<Order> total = backStageService.turnoverTotal();
		return Msg.success().add("total", total);

	}

	// 总用户数/出行人数
	@RequestMapping(value = "/userTotal", method = RequestMethod.POST)
	@ResponseBody
	public Msg userTotal() {
		UserInfo userInfo = new UserInfo();
		userInfo.setRole("3");
		int count = backStageService.userTotal(userInfo);
		return Msg.success().add("count", count);

	}

	// 订单数量
	@RequestMapping(value = "/dindanTotal", method = RequestMethod.POST)
	@ResponseBody
	public Msg dindanTotal() {
		int count = backStageService.dindanTotal();
		return Msg.success().add("count", count);

	}

	// 跳转到查询所有的景点信息页面
	// 查询景点类型
	@RequestMapping("/scenicSpotType")
	@ResponseBody
	public Msg scenicSpotType() {
		List<ScenicSpotTypesInfo> scenicSpotType = backStageService.scenicSpotType();
		return Msg.success().add("scenicSpotType", scenicSpotType);
	}

	// 跳转到查询所有的游记信息页面
	@RequestMapping("/travelsInfo_list")
	public String travelsInfoList() {
		return "admin/backstage/travels/travels_list";// WEB-INF/admin/backstage/userInfo/userInfo_list.jsp
	}

	// 查询游记信息
	@RequestMapping("/doTravelsList")
	@ResponseBody
	public Msg doTravelsList(@RequestParam(value = "pageCurrent", defaultValue = "1") Integer pageCurrent,
			String title) {
		// 设计分页参数
		PageHelper.startPage(pageCurrent, 6);
		TravelsInfo travelsInfo = new TravelsInfo();
		travelsInfo.setTitle(title);
		List<TravelsInfo> travels = backStageService.getAllTravelsInfo(travelsInfo);
		// 使用pageinfo封装查询结果
		PageInfo page = new PageInfo(travels, 6);

		return Msg.success().add("pageObject", page);
	}

	// 根据id删除游记信息
	@RequestMapping(value = "/deltravelsInfoByid/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deltravelsInfoByid(@PathVariable("id") Integer id) {

		backStageService.deltravelsInfoByid(id);

		return Msg.success();

	}

	// 跳转到查询所有的新闻信息页面
	@RequestMapping("/newsInfo_list")
	public String newsInfo_list() {
		return "admin/backstage/news/news_list";// WEB-INF/admin/backstage/news/news_list.jsp
	}
	// 跳转到发表新闻信息页面
		@RequestMapping("/newsInfo_add")
		public String newsInfo_add() {
			return "admin/backstage/news/news_add";// WEB-INF/admin/backstage/news/news_list.jsp
		}
	// 查询新闻信息
	@RequestMapping("/newsInfoList")
	@ResponseBody
	public Msg newsInfoList(@RequestParam(value = "pageCurrent", defaultValue = "1") Integer pageCurrent, String title) {
		// 设计分页参数
		PageHelper.startPage(pageCurrent, 6);
		NewsInfo newsInfo = new NewsInfo();
		newsInfo.setTitle(title);
		List<NewsInfo> news = backStageService.getAllNewsInfo(newsInfo);
		// 使用pageinfo封装查询结果
		PageInfo page = new PageInfo(news, 6);

		return Msg.success().add("pageObject", page);
	}
	// 根据id删除新闻信息
	@RequestMapping(value = "/delnewsInfoByid/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg delnewsInfoByid(@PathVariable("id") Integer id) {
		backStageService.delnewsInfoByid(id);
		return Msg.success();

	}
	//添加新的新闻
	@RequestMapping(value="/doSaveNewsInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg doSaveNewsInfo(String author,String title,String text) {
		NewsInfo newsInfo=new NewsInfo();
		newsInfo.setAuthor(author);
		newsInfo.setText(text);
		newsInfo.setTitle(title);
		newsInfo.setCreationTime(new Date());
		int count=backStageService.doSaveNewsInfo(newsInfo);
		return Msg.success();
	}
	//跳转到修改密码页面
	@RequestMapping("/change_password")
	public String change_password() {
		return "admin/backstage/system/change_password";// WEB-INF/admin/backstage/system/change_password.jsp
	}
	
	//跳转用户数据统计界面
	@RequestMapping("/user_data")
public String userData(){
	return "admin/backstage/data/user_name";
}
//性别数据统计
	@RequestMapping("/genderStatistics")
	@ResponseBody
	public Msg genderStatistics(){
		List<UserInfo> gender=backStageService.genderStatistics();
		return Msg.success().add("gender", gender);
	}
	//跳转到修改个人信息页面
	@RequestMapping("/personal_info")
	public String personal_info(){
		return "admin/backstage/system/personalInfo";
	}
	//根据id查找用户个人信息
	@RequestMapping("/findPersonalInfoId")
	@ResponseBody
	public Msg findPersonalInfoId(String id){
		UserInfo userInfo=backStageService.findPersonalInfoId(Integer.parseInt(id));
		return Msg.success().add("userInfo",userInfo);
	}
	//管理人员修改个人信息
	@RequestMapping("/adminUpdateUserInfo")
	@ResponseBody
	public Msg adminUpdateUserInfo(String id,String name,String gender,String birthday,String phone,String mailbox,String address){
		UserInfo userInfo=new UserInfo();
		userInfo.setId(Integer.parseInt(id));
		userInfo.setName(name);
		userInfo.setGender(gender);
		userInfo.setBirthday(birthday);
		userInfo.setPhone(phone);
		userInfo.setMailbox(mailbox);
		userInfo.setAddress(address);
		int count=backStageService.adminUpdateUserInfo(userInfo);
		return Msg.success().add("count",count);
	}
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

	@RequestMapping("/guideInfo_edit")
	public String guideeditUI() {
		return "admin/backstage/guideInfo/guideInfo_edit";// WEB-INF/pages/product/project_edit.jsp
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
