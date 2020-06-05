package com.travel.controller;

import static org.junit.Assert.assertNotEquals;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ha.backend.CollectedInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.objenesis.instantiator.sun.MagicInstantiator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.bean.CollectionInfo;
import com.travel.bean.CommentInfo;
import com.travel.bean.ItineraryRouteInfo;
import com.travel.bean.Msg;
import com.travel.bean.NewsInfo;
import com.travel.bean.Order;
import com.travel.bean.ReservationInfo;
import com.travel.bean.ScenicSpotInfo;
import com.travel.bean.ScenicSpotTypesInfo;
import com.travel.bean.TravelsInfo;
import com.travel.bean.UserInfo;
import com.travel.service.WebService;

@Controller
@RequestMapping("/web")
public class WebController {
	/** 返回信息_返回结果标记 */
	public static final String RESULT = "RESULT";
	/** 返回信息_返回结果信息标记 */
	public static final String MESSAGE = "MESSAGE";
	/** 返回信息_成功 */
	public static final String SUCCESS = "SUCCESS";
	/** 返回信息_失败 */
	public static final String FAILURE = "FAILURE";

	@Autowired
	WebService webService;
	// 网站首页

	@RequestMapping("/index")
	@ResponseBody
	public ModelAndView list(Model model, ScenicSpotInfo scenicSpotInfo) {
		List<ScenicSpotInfo> scenicSpotInfo1 = webService.scenicSpot();
		ModelAndView mav = new ModelAndView();
		mav.addObject("scenicSpotInfo1", scenicSpotInfo1);
		mav.setViewName("web/index");
		return mav;
	}
	// 跳转到更多线路
		@RequestMapping("/moreXinlu")
		public String moreXinlu() {
			return "web/xianlu/more";
		}

	// 线路列表
	@RequestMapping("/more")
	@ResponseBody
	public Msg more(@RequestBody Map<String, String> requestBody) {
		int page = Integer.valueOf(requestBody.get("page"));
		PageHelper.startPage(page, 5);
		ScenicSpotInfo scenicSpotInfo = new ScenicSpotInfo();
		scenicSpotInfo.setDay(requestBody.get("day"));
		scenicSpotInfo.setCity(requestBody.get("city"));
		scenicSpotInfo.setType(requestBody.get("type"));
		List<ScenicSpotInfo> scenicSpotInfo1 = webService.scenicSpotMore(scenicSpotInfo);
		PageInfo scenicSpotInfo2 = new PageInfo(scenicSpotInfo1, 5);
		return Msg.success().add("scenicSpotInfo", scenicSpotInfo2);
	}

	// 跳转到详情页面根据id显示
	@RequestMapping("/detail")
	public ModelAndView detail(Model model, String id) {
		ScenicSpotInfo scenicSpotInfo = webService.scenicSpotInfo(Integer.parseInt(id));
		ModelAndView mav = new ModelAndView();
		mav.addObject("scenicSpotInfo", scenicSpotInfo);
		mav.addObject(RESULT, SUCCESS);
		mav.setViewName("web/detail/detail");
		return mav;
	}

//产品类型查询
	@RequestMapping(value = "/typeList", method = RequestMethod.POST)
	@ResponseBody
	public Msg typeList(@RequestBody Map<String, String> requestBody) {

		ScenicSpotTypesInfo scenicSpotTypesInfo=new ScenicSpotTypesInfo();
		scenicSpotTypesInfo.setId(Integer.parseInt(requestBody.get("type")));
		ScenicSpotTypesInfo type= webService.typeList(scenicSpotTypesInfo);
		if (type !=null) {
			return Msg.success().add("type", type);
		} else {
			return Msg.fail("添加失败");
		}
	}
	// 用户添加订单
	@RequestMapping(value = "/makeOrder", method = RequestMethod.POST)
	@ResponseBody
	public Msg makeOrder(@RequestBody Map<String, String> requestBody) {
		Order order = new Order();
		order.setUserName(requestBody.get("userName"));
		order.setName(requestBody.get("name"));
		order.setNumber(requestBody.get("number"));
		order.setTotal(requestBody.get("total"));
		order.setPhone(requestBody.get("phone"));
		order.setContacts(requestBody.get("contacts"));
		order.setDepartureTime(requestBody.get("departureTime"));
		order.setState(requestBody.get("state"));
		order.setCreationTime(new Date());
		int count = webService.addOrder(order);
		if (count != 0) {
			return Msg.success();
		} else {
			return Msg.fail("添加失败");
		}
	}

	// 展示行程路线
	@RequestMapping(value = "/itineraryList", method = RequestMethod.POST)
	@ResponseBody
	public Msg itineraryList(@RequestBody Map<String, String> requestBody) {
		ItineraryRouteInfo itineraryRouteInfo = new ItineraryRouteInfo();
		itineraryRouteInfo.setScenicSpotid(requestBody.get("scenicSpotid"));
		List<ItineraryRouteInfo> itineraryRoute = webService.itineraryList(itineraryRouteInfo);
		return Msg.success().add("itineraryRoute", itineraryRoute);

	}

	// 跳转到个人中心页面
	@RequestMapping("/person")
	public String personalCenter() {
		return "web/person/person"; // /travel/src/main/webapp/WEB-INF/views/web/person/personalCenter.jsp
	}

//点击旅游订单按钮跳转到点单展示页面
	@RequestMapping("/dindan")
	public String dindan() {
		return "web/person/luyou/dindanList"; // /travel/src/main/webapp/WEB-INF/views/web/person/luyou/dindanList.jsp
	}

	// 根据userName查询订单
	@RequestMapping(value = "/dindanList", method = RequestMethod.POST)
	@ResponseBody
	public Msg dindanList(Map map, String userName) {
		List<Order> dindanList = webService.dindanList(userName);
		return Msg.success().add("dindanList", dindanList);
	}
	
	//根据订单id查看详细订单信息
	@RequestMapping(value = "/orderListId", method = RequestMethod.POST)
	@ResponseBody
	public Msg dindanList(String id) {
		Order orderListId = webService.orderListId(Integer.parseInt(id));
		return Msg.success().add("orderListId", orderListId);
	}
	//修改付款状态
	@RequestMapping(value = "/modifyPayment", method = RequestMethod.POST)
	@ResponseBody
	public Msg modifyPayment(@RequestBody Map<String, String> requestBody) {
		Order order=new Order();
		order.setId(Integer.parseInt(requestBody.get("id")));
		order.setState(requestBody.get("state"));
		order.setNumber(requestBody.get("number"));
		order.setTotal(requestBody.get("total"));
		order.setContacts(requestBody.get("contacts"));
		order.setPhone(requestBody.get("phone"));
		int count = webService.modifyPayment(order);
		return Msg.success();

	}
	// 用户删除个人订单
	@RequestMapping(value = "/delDindan", method = RequestMethod.POST)
	@ResponseBody
	public Msg delDindan(int id) {
		int count = webService.delDindan(id);
		return Msg.success();

	}

	// 点击个人资料按钮跳转到个人信息展示页面
	@RequestMapping("/personalInfo")
	public String personalInfo() {
		return "web/person/personalCenter/personalInfo"; // /travel/src/main/webapp/WEB-INF/views/web/person/personalCenter/personalInfo.jsp
	}

	// 用户的个人信息展示
	@RequestMapping(value = "/persionUserInfoList", method = RequestMethod.POST)
	@ResponseBody
	public Msg persionUserInfoList(@RequestBody Map<String, String> requestBody) {
		UserInfo userInfo = new UserInfo();
		userInfo.setId(Integer.parseInt(requestBody.get("id")));
		List<UserInfo> persionUserInfoList = webService.persionUserInfoList(userInfo);
		return Msg.success().add("persionUserInfoList", persionUserInfoList);
	}

	// 用户修改自己的信息
	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateUserInfo(@RequestBody Map<String, String> requestBody) {
		
		UserInfo userInfo = new UserInfo();
		userInfo.setId(Integer.parseInt(requestBody.get("id")));
		userInfo.setUserName(requestBody.get("userName"));
		userInfo.setName(requestBody.get("name"));
		userInfo.setGender(requestBody.get("gender"));
		userInfo.setBirthday(requestBody.get("birthday"));
		userInfo.setPhone(requestBody.get("phone"));
		userInfo.setMailbox(requestBody.get("mailbox"));
		userInfo.setAddress(requestBody.get("address"));
		int count = webService.updateUserInfo(userInfo);
		if (count != 0) {
			return Msg.success();
		} else {
			return Msg.fail("修改失败");
		}

	}

	// 用户修改头像
	@RequestMapping(value = "/changePhoto", method = RequestMethod.POST)
	@ResponseBody
	public Msg changePhoto(@RequestParam("photo") MultipartFile photo, HttpSession session, Model model,
			HttpServletRequest request, String id) throws Exception {
		UserInfo userInfo = new UserInfo();
		String originalFilename = photo.getOriginalFilename();
		if (photo != null && originalFilename != null && originalFilename.length() > 0) {
			String pic_path = "F:\\upload";
			String newFileName = UUID.randomUUID() + originalFilename;
			File newFile = new File(pic_path, newFileName);
			photo.transferTo(newFile);
			userInfo.setPhoto(newFileName);
		}
		userInfo.setId(Integer.parseInt(id));
		int count = webService.changePhoto(userInfo);
		return Msg.success().add("count", count);

	}

	// 点击密码设置按钮跳转到密码设置展示页面
	@RequestMapping("/changePassword")
	public String changePassword() {
		return "web/person/personalCenter/changePassword"; // /travel/src/main/webapp/WEB-INF/views/web/person/personalCenter/personalInfo.jsp
	}

	// 用户修改密码
	@RequestMapping(value = "/updateUserPwd", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateUserPwd(@RequestBody Map<String, String> requestBody) {
		UserInfo userInfo = new UserInfo();
		userInfo.setId(Integer.parseInt(requestBody.get("id")));
		userInfo.setPassword(requestBody.get("oldPassword"));
		UserInfo checkUser = webService.checkOldPwd(userInfo);
		if (checkUser != null) {
			UserInfo newUserInfo = new UserInfo();
			newUserInfo.setId(Integer.parseInt(requestBody.get("id")));
			newUserInfo.setPassword(requestBody.get("newPassword"));
			int count = webService.updateUserPwd(newUserInfo);
			if (count != 0) {
				return Msg.success();
			} else {
				return Msg.fail("修改失败");
			}
		} else {
			return Msg.fail("原密码输入有误，请重新输入");
		}
	}

	/* 用户收藏旅游景点 */
	@RequestMapping(value = "/addCollection", method = RequestMethod.POST)
	@ResponseBody
	public Msg addCollection(@RequestBody Map<String, String> requestBody) {
		CollectionInfo collectionInfo = new CollectionInfo();
		collectionInfo.setUserid(Integer.parseInt(requestBody.get("userid")));
		collectionInfo.setScenicSpotid(Integer.parseInt(requestBody.get("scenicSpotid")));
		int count = webService.addCollection(collectionInfo);

		return Msg.success();

	}

	/* 用户取消收藏旅游景点 */
	@RequestMapping(value = "/delCollection", method = RequestMethod.POST)
	@ResponseBody
	public Msg delCollection(@RequestBody Map<String, String> requestBody) {
		CollectionInfo collectionInfo = new CollectionInfo();
		collectionInfo.setUserid(Integer.parseInt(requestBody.get("userid")));
		collectionInfo.setScenicSpotid(Integer.parseInt(requestBody.get("scenicSpotid")));
		int count = webService.delCollection(collectionInfo);
		return Msg.success();

	}

	/* 查询该用户是否已经收藏了该景点 */
	@RequestMapping(value = "/checkCollection", method = RequestMethod.POST)
	@ResponseBody
	public Msg checkCollection(@RequestBody Map<String, String> requestBody) {
		CollectionInfo collectionInfo = new CollectionInfo();
		collectionInfo.setUserid(Integer.parseInt(requestBody.get("userid")));
		collectionInfo.setScenicSpotid(Integer.parseInt(requestBody.get("scenicSpotid")));
		int count = webService.checkCollection(collectionInfo);
		if (count > 0) {
			return Msg.success();
		} else {
			return Msg.fail("没有收藏");
		}
	}

	// 用户点击我的收藏按钮显示我的收藏
	@RequestMapping("/collection")
	public String collection() {
		return "web/person/personalCenter/collection"; // /travel/src/main/webapp/WEB-INF/views/web/person/personalCenter/collection.jsp

	}

	// 查询我的收藏
	@RequestMapping(value = "/collectionList")
	@ResponseBody
	public Msg collectionList(@RequestBody Map<String, String> requestBody) {
		CollectionInfo collectionInfo = new CollectionInfo();
		collectionInfo.setUserid(Integer.parseInt(requestBody.get("userid")));
		List<ScenicSpotInfo> collectionList = webService.collectionSelect(collectionInfo);
		return Msg.success().add("collectionList", collectionList);
	}

	// 用户删除收藏
	@RequestMapping(value = "/delCcollection", method = RequestMethod.POST)
	@ResponseBody
	public Msg delCcollection(Integer scenicSpotid) {
		/* CollectionInfo collectionInfo = new CollectionInfo(); */
		/* collectionInfo.setScenicSpotid(Integer.parseInt(requestBody.get("id"))); */
		int count = webService.delCcollection(scenicSpotid);
		return Msg.success();

	}

	// 预定须知信息的查询
	@RequestMapping(value = "/reservationList", method = RequestMethod.POST)
	@ResponseBody
	public Msg reservationList() {
		List<ReservationInfo> reservation = webService.reservationList();
		return Msg.success().add("reservation", reservation);
	}

	/* 游记 */
	// 跳转到游记页面

	@RequestMapping("/travels")
	public String travels() {
		return "web/travels/travels";
	}

	// 游记的展示
	@RequestMapping(value = "/travelsList", method = RequestMethod.POST)
	@ResponseBody
	public Msg travelsList(@RequestBody Map<String, String> requestBody) {
		TravelsInfo travelsInfo=new TravelsInfo();
		travelsInfo.setUserid(requestBody.get("userid"));
		List<TravelsInfo> travels = webService.travelsList(travelsInfo);
		return Msg.success().add("travels", travels);
	}
	//跳转并展示游记详情
	@RequestMapping("/travelsDetails")
	public ModelAndView travelsDetails(String id) {
		TravelsInfo travels=webService.travelsDetails(Integer.parseInt(id));
		ModelAndView mav = new ModelAndView();
		mav.addObject(RESULT, SUCCESS);
		mav.addObject("travels", travels);
		mav.setViewName("web/travels/travelsDetails");
		return mav;
		
	}
	
	//跳转到游记的添加页面
	@RequestMapping("/travelsAdd")
	public String travelsAdd() {
		return "web/travels/travelsAdd";
	}
	//添加游记
	@RequestMapping(value="/travels_add",method=RequestMethod.POST)
	@ResponseBody
	public Msg  addTravels(@RequestParam("cover") MultipartFile cover, HttpSession session, Model model,
			HttpServletRequest request,String text,String userid,String title,String introduction ) throws Exception {
		TravelsInfo travels=new TravelsInfo();
		String originalFilename = cover.getOriginalFilename();
		if (cover != null && originalFilename != null && originalFilename.length() > 0) {
			String pic_path = "F:\\upload";
			String newFileName = UUID.randomUUID() + originalFilename;
			File newFile = new File(pic_path, newFileName);
			cover.transferTo(newFile);
			travels.setCover(newFileName);
		}
		travels.setUserid(userid);
		travels.setTitle(title);
		travels.setIntroduction(introduction);
		travels.setText(text);
		travels.setCreationtime(new Date());
		
		int count=webService.addTravels(travels);
		
		return Msg.success();
	}
	
	// 评论
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	@ResponseBody
	public Msg comment(@RequestBody Map<String, String> requestBody) {
		CommentInfo commentInfo = new CommentInfo();
		commentInfo.setUserid(requestBody.get("userid"));
		commentInfo.setScenicSpotName(requestBody.get("scenicSpotName"));
		commentInfo.setContent(requestBody.get("content"));
		commentInfo.setFraction(requestBody.get("fraction"));
		commentInfo.setDindanid(requestBody.get("dindanid"));
		commentInfo.setCommentaryTime(new Date());
		int count = webService.comment(commentInfo);
		return Msg.success();
	}

	// 修改订单状态
	@RequestMapping(value = "/modifyState", method = RequestMethod.POST)
	@ResponseBody
	public Msg modifyState(@RequestBody Map<String, String> requestBody) {
		Order order = new Order();
		order.setId(Integer.parseInt(requestBody.get("dindanid")));
		order.setState(requestBody.get("state"));
		order = webService.modifyState(order);
		return Msg.success();
	}

	// 线路景点详情页面的游客点评的查询显示（根据线路名称查）
	@RequestMapping(value = "/commentDisplay", method = RequestMethod.POST)
	@ResponseBody
	public Msg commentDisplay(@RequestBody Map<String, String> requestBody) {
		int page = Integer.valueOf(requestBody.get("page"));
		PageHelper.startPage(page, 5);
		CommentInfo commentInfo = new CommentInfo();
		commentInfo.setScenicSpotName(requestBody.get("scenicSpotName"));
		/* commentInfo.setFraction(requestBody.get("fraction")); */
		List<CommentInfo> commentList = webService.commentDisplay(commentInfo);
		PageInfo commentpage = new PageInfo(commentList, 5);
		return Msg.success().add("commentList", commentpage);
	}

	// 用户查看个人的评论
	@RequestMapping(value = "/myCommentList", method = RequestMethod.POST)
	@ResponseBody
	public Msg myCommentList(@RequestBody Map<String, String> requestBody) {
		int page = Integer.valueOf(requestBody.get("page"));
		PageHelper.startPage(page, 5);
		CommentInfo commentInfo = new CommentInfo();
		commentInfo.setUserid(requestBody.get("userid"));
		List<CommentInfo> myListComment = webService.myCommentList(commentInfo);
		PageInfo myCommentList = new PageInfo(myListComment, 5);
		return Msg.success().add("myCommentList", myCommentList);
	}

	// 跳转到我的收藏页面
	@RequestMapping("/comments")
	public String comments() {
		return "web/person/personalCenter/myComment";
	}

	// 删除我的评论
	@RequestMapping(value = "/delMyComment", method = RequestMethod.POST)
	@ResponseBody
	public Msg delMyComment(int pid) {
		int count = webService.delMyComment(pid);
		return Msg.success();
	}

	// 跳转到我的提问页面
	@RequestMapping("/myquestion")
	public String myquestion() {
		return "web/person/personalCenter/myquestion";
	}

	// 跳转到我的新闻页面
	@RequestMapping("/news")
	public String news() {
		return "web/news/news";

	}

	// 新闻页面查询
	@RequestMapping(value="/newsList",method=RequestMethod.POST)
	@ResponseBody
	public Msg newsList() {
		List<NewsInfo> news = webService.newsList();
		return Msg.success().add("news", news);
	}
	// 跳转到新闻详情根据id显示
			@RequestMapping("/newsListId")
			@ResponseBody
			public ModelAndView newsListId(Integer id) {
				NewsInfo newsInfo=webService.newsListId(id);
				ModelAndView mav = new ModelAndView();
				mav.addObject("newsInfo", newsInfo);
				mav.setViewName("web/news/newsList");
				return mav;
			}
			
			//跳转到导游展示页面
			@RequestMapping("/guide")
			public String guide() {
				return "web/guide/guides";
			}
			@RequestMapping(value="/guideList",method=RequestMethod.POST)
			@ResponseBody
			public Msg guideList(@RequestBody Map<String, String> requestBody) {
				UserInfo userInfo=new UserInfo();
				userInfo.setRole((requestBody.get("role")));
				List<UserInfo> guides=webService.guideList(userInfo);
				if(guides!=null) {return Msg.success().add("guides", guides);}else {
					return Msg.fail("网络错误，请稍后重试");
				}
			}
			@RequestMapping("/others")
			public String others() {
				return "others";
			}
			@RequestMapping("/others2")
			public String others2() {
				return "web/others/others";
			}
}
