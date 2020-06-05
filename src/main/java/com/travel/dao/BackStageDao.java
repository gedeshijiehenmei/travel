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

public interface BackStageDao {

	//景点信息添加
	int addScenicSpotInfo(ScenicSpotInfo scenicSpotInfo);
//查询所有的景点信息
	List<ScenicSpotInfo> scenicSpotInfo(ScenicSpotInfo scenicSpotInfo);
	List<Order> dindanInfoList(Order order);
	Order doFindDindanInfoById(Integer id);
	void doUpdateDindanInfo(Order order);
	void deleteDindanInfoByid(Integer id);
	List<CommentInfo> commentInfoList(CommentInfo commentInfo);
	void deleteCommentInfoByid(Integer id);
	int userTotal(UserInfo userInfo);
	int dindanTotal();
	List<Order> turnoverTotal();
	List<ScenicSpotTypesInfo> scenicSpotType();
	int addScenicSpotInfoDetail(ItineraryRouteInfo itineraryRouteInfo);
	List<TravelsInfo> getAllTravelsInfo(TravelsInfo travelsInfo);
	void deltravelsInfoByid(Integer id);
	List<NewsInfo> getAllNewsInfo(NewsInfo newsInfo);
	void delnewsInfoByid(Integer id);
	int doSaveNewsInfo(NewsInfo newsInfo);
	List<UserInfo> genderStatistics();
	UserInfo findPersonalInfoId(int id);
	int adminUpdateUserInfo(UserInfo userInfo);
	ScenicSpotInfo findScenicSpotName(String scenicSpotName);
	void deletescenicSpotInfoByid(Integer id);

}
