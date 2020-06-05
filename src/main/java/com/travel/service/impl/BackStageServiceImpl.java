package com.travel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.bean.CommentInfo;
import com.travel.bean.ItineraryRouteInfo;
import com.travel.bean.NewsInfo;
import com.travel.bean.Order;
import com.travel.bean.ScenicSpotInfo;
import com.travel.bean.ScenicSpotTypesInfo;
import com.travel.bean.TravelsInfo;
import com.travel.bean.UserInfo;
import com.travel.dao.BackStageDao;
import com.travel.service.BackStageService;

@Service
public class BackStageServiceImpl implements BackStageService {

	@Autowired
	BackStageDao backStageDao;
	//景点信息添加
	public int addScenicSpotInfo(ScenicSpotInfo scenicSpotInfo) {
		
		return backStageDao.addScenicSpotInfo(scenicSpotInfo);
		 
	}
	public List<ScenicSpotInfo> scenicSpotInfo(ScenicSpotInfo scenicSpotInfo) {
		// TODO Auto-generated method stub
		return backStageDao.scenicSpotInfo(scenicSpotInfo);
	}
	public List<Order> dindanInfoList(Order order) {
		// TODO Auto-generated method stub
		return backStageDao.dindanInfoList(order);
	}
	public Order doFindDindanInfoById(Integer id) {
		// TODO Auto-generated method stub
		return backStageDao.doFindDindanInfoById(id);
	}
	public void doUpdateDindanInfo(Order order) {
		// TODO Auto-generated method stub
		backStageDao.doUpdateDindanInfo(order);
	}
	public void deleteDindanInfoByid(Integer id) {
		// TODO Auto-generated method stub
		backStageDao.deleteDindanInfoByid(id);
	}
	public List<CommentInfo> commentInfoList(CommentInfo commentInfo) {
		// TODO Auto-generated method stub
		return backStageDao.commentInfoList(commentInfo);
	}
	public void deleteCommentInfoByid(Integer id) {
		// TODO Auto-generated method stub
		backStageDao.deleteCommentInfoByid(id);
	}
	public int userTotal(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return backStageDao.userTotal(userInfo);
	}
	public int dindanTotal() {
		// TODO Auto-generated method stub
		return backStageDao.dindanTotal();
	}
	public List<Order> turnoverTotal() {
		// TODO Auto-generated method stub
		return backStageDao.turnoverTotal();
	}
	public List<ScenicSpotTypesInfo> scenicSpotType() {
		// TODO Auto-generated method stub
		return backStageDao.scenicSpotType();
	}
	public int addScenicSpotInfoDetail(ItineraryRouteInfo itineraryRouteInfo) {
		// TODO Auto-generated method stub
		return backStageDao.addScenicSpotInfoDetail(itineraryRouteInfo);
	}
	public List<TravelsInfo> getAllTravelsInfo(TravelsInfo travelsInfo) {
		// TODO Auto-generated method stub
		return backStageDao.getAllTravelsInfo(travelsInfo);
	}
	public void deltravelsInfoByid(Integer id) {
		// TODO Auto-generated method stub
		backStageDao.deltravelsInfoByid(id);
	}
	public List<NewsInfo> getAllNewsInfo(NewsInfo newsInfo) {
		// TODO Auto-generated method stub
		return backStageDao.getAllNewsInfo(newsInfo);
	}
	public void delnewsInfoByid(Integer id) {
		// TODO Auto-generated method stub
		backStageDao.delnewsInfoByid(id);
	}
	public int doSaveNewsInfo(NewsInfo newsInfo) {
		// TODO Auto-generated method stub
		return backStageDao.doSaveNewsInfo(newsInfo);
	}
	public List<UserInfo> genderStatistics() {
		// TODO Auto-generated method stub
		return backStageDao.genderStatistics();
	}
	public UserInfo findPersonalInfoId(int id) {
		// TODO Auto-generated method stub
		return backStageDao.findPersonalInfoId(id);
	}
	public int adminUpdateUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return backStageDao.adminUpdateUserInfo(userInfo);
	}
	public ScenicSpotInfo findScenicSpotName(String scenicSpotName) {
		// TODO Auto-generated method stub
		return backStageDao.findScenicSpotName(scenicSpotName);
	}
	public void deletescenicSpotInfoByid(Integer id) {
		// TODO Auto-generated method stub
		backStageDao.deletescenicSpotInfoByid(id);
	}

}
