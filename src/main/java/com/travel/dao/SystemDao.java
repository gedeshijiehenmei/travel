package com.travel.dao;

import java.util.List;

import com.travel.bean.CommentInfo;
import com.travel.bean.ItineraryRouteInfo;
import com.travel.bean.NewsInfo;
import com.travel.bean.Order;
import com.travel.bean.ScenicSpotInfo;
import com.travel.bean.ScenicSpotTypesInfo;
import com.travel.bean.TravelsInfo;
import com.travel.bean.UserInfo;

public interface SystemDao {
	UserInfo selectUser(UserInfo userInfo);
	UserInfo findUserName(String userName);
	int saveUserRegister(UserInfo userInfo);

}
