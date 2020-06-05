package com.travel.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.travel.bean.UserInfo;
import com.travel.dao.UserInfoDao;

public interface UserInfoService {

	// 管理员登录

//查询所有用户信息
	List<UserInfo> getAllUserInfo(UserInfo userInfo);

	// 检验用户名是否可用
	boolean checkuser(String userName);

	int doSaveUserInfo(UserInfo userInfo);

	UserInfo findUserId(Integer id);

	/* 游客信息更新 */
	void updateUserInfo(UserInfo userInfo);
	// 游客信息删除

	void deleteuserInfoByid(Integer id);


	void  doStateById(UserInfo userInfo);


}
