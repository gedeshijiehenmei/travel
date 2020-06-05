package com.travel.service;

import java.util.List;

import com.travel.bean.CollectionInfo;
import com.travel.bean.CommentInfo;
import com.travel.bean.ItineraryRouteInfo;
import com.travel.bean.NewsInfo;
import com.travel.bean.Order;
import com.travel.bean.ReservationInfo;
import com.travel.bean.ScenicSpotInfo;
import com.travel.bean.ScenicSpotTypesInfo;
import com.travel.bean.TravelsInfo;
import com.travel.bean.UserInfo;

public interface WebService {

	List<ScenicSpotInfo> scenicSpot();

	ScenicSpotInfo scenicSpotInfo(int id);

	int addOrder(Order order);

	List<Order> dindanList(String userName);

	int delDindan(Integer id);

	int updateUserInfo(UserInfo userInfo);

	int changePhoto(UserInfo userInfo);

	UserInfo checkOldPwd(UserInfo userInfo);

	int updateUserPwd(UserInfo userInfo);

	int addCollection(CollectionInfo collectionInfo);

	int delCollection(CollectionInfo collectionInfo);

	int checkCollection(CollectionInfo collectionInfo);

	List<ScenicSpotInfo> collectionSelect(CollectionInfo collectionInfo);

	int delCcollection(Integer scenicSpotid);

	List<ItineraryRouteInfo> itineraryList(ItineraryRouteInfo itineraryRouteInfo);

	List<ReservationInfo> reservationList();

	List<TravelsInfo> travelsList(TravelsInfo travelsInfo);

	int comment(CommentInfo commentInfo);

	Order modifyState(Order order);

	List<CommentInfo> commentDisplay(CommentInfo commentInfo);

	List<CommentInfo> myCommentList(CommentInfo commentInfo);

	int delMyComment(Integer pid);

	List<UserInfo> persionUserInfoList(UserInfo userInfo);

	List<ScenicSpotInfo> scenicSpotMore(ScenicSpotInfo scenicSpotInfo);

	List<NewsInfo> newsList();

	NewsInfo newsListId(Integer id);

	int addTravels(TravelsInfo travels);

	TravelsInfo travelsDetails(Integer id);

	List<UserInfo> guideList(UserInfo userInfo);

	Order orderListId(int id);

	int modifyPayment(Order order);

	ScenicSpotTypesInfo typeList(ScenicSpotTypesInfo scenicSpotTypesInfo);



}
