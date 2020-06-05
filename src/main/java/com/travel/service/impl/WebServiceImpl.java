package com.travel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
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
import com.travel.dao.WebDao;
import com.travel.service.WebService;

@Service
public class WebServiceImpl implements WebService {

	@Autowired
	WebDao webDao;
	
	public List<ScenicSpotInfo> scenicSpot() {
		// TODO Auto-generated method stub
		return webDao.scenicSpot(null);
	}

	public ScenicSpotInfo scenicSpotInfo(int id) {
		// TODO Auto-generated method stub
		 return webDao.scenicSpotInfobyid(id);
	}

	public int addOrder(Order order) {
		// TODO Auto-generated method stub
		return webDao.addOrder(order);
	}

	public List<Order> dindanList(String userName) {
		// TODO Auto-generated method stub
		return webDao.dindanList(userName);
	}

	public int delDindan(Integer id) {
		// TODO Auto-generated method stub
		return webDao.delDindan(id);
	}

	public int updateUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return webDao.updateUserInfo(userInfo);
	}

	public int changePhoto(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return webDao.changePhoto(userInfo);
	}

	public UserInfo checkOldPwd(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return webDao.checkOldPwd(userInfo);
	}

	public int updateUserPwd(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return webDao.updateUserPwd(userInfo);
	}

	public int addCollection(CollectionInfo collectionInfo) {
		// TODO Auto-generated method stub
		return webDao.addCollection(collectionInfo);
	}

	public int delCollection(CollectionInfo collectionInfo) {
		// TODO Auto-generated method stub
		return webDao.delCollection(collectionInfo);
	}

	public int checkCollection(CollectionInfo collectionInfo) {
		// TODO Auto-generated method stub
		return webDao.checkCollection(collectionInfo);
	}

	public List<ScenicSpotInfo> collectionSelect(CollectionInfo collectionInfo) {
		// TODO Auto-generated method stub
		return webDao.collectionSelect(collectionInfo);
	}

	public int delCcollection(Integer scenicSpotid) {
		// TODO Auto-generated method stub
		return webDao.delCcollection(scenicSpotid);
	}

	public List<ItineraryRouteInfo> itineraryList(ItineraryRouteInfo itineraryRouteInfo) {
		// TODO Auto-generated method stub
		return webDao.itineraryList(itineraryRouteInfo);
	}

	public List<ReservationInfo> reservationList() {
		// TODO Auto-generated method stub
		return webDao.reservationList();
	}

	public List<TravelsInfo> travelsList(TravelsInfo travelsInfo) {
		// TODO Auto-generated method stub
		return webDao.travelsList(travelsInfo);
	}

	public int comment(CommentInfo commentInfo) {
		// TODO Auto-generated method stub
		return webDao.comment(commentInfo);
	}

	public Order modifyState(Order order) {
		// TODO Auto-generated method stub
		return webDao.modifyState(order);
	}

	public List<CommentInfo> commentDisplay(CommentInfo commentInfo) {
		// TODO Auto-generated method stub
		return webDao.commentDisplay(commentInfo);
	}

	public List<CommentInfo> myCommentList(CommentInfo commentInfo) {
		// TODO Auto-generated method stub
		return webDao.myCommentList(commentInfo);
	}

	public int delMyComment(Integer pid) {
		// TODO Auto-generated method stub
		return webDao.delMyComment(pid);
	}

	public List<UserInfo> persionUserInfoList(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return webDao.persionUserInfoList(userInfo);
	}

	public List<ScenicSpotInfo> scenicSpotMore(ScenicSpotInfo scenicSpotInfo) {
		// TODO Auto-generated method stub
		return webDao.scenicSpotMore(scenicSpotInfo);
	}

	public List<NewsInfo> newsList() {
		// TODO Auto-generated method stub
		return webDao.newsList();
	}

	public NewsInfo newsListId(Integer id) {
		// TODO Auto-generated method stub
		return webDao.newsListId(id);
	}

	public int addTravels(TravelsInfo travels) {
		// TODO Auto-generated method stub
		return webDao.addTravels(travels);
	}

	public TravelsInfo travelsDetails(Integer id) {
		// TODO Auto-generated method stub
		return webDao.travelsDetails(id);
	}

	public List<UserInfo> guideList(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return webDao.guideList(userInfo);
	}

	public Order orderListId(int id) {
		// TODO Auto-generated method stub
		return webDao.orderListId(id);
	}

	public int modifyPayment(Order order) {
		// TODO Auto-generated method stub
		return webDao.modifyPayment(order);
	}

	public ScenicSpotTypesInfo typeList(ScenicSpotTypesInfo scenicSpotTypesInfo) {
		// TODO Auto-generated method stub
		return webDao.typeList(scenicSpotTypesInfo);
	}

}
