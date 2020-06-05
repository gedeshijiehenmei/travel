package com.travel.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.travel.bean.UserInfo;
import com.travel.dao.SystemDao;
import com.travel.dao.UserInfoDao;
import com.travel.service.SystemService;
import com.travel.service.UserInfoService;

@Service
public class SystemServiceImpl implements SystemService {
	@Autowired
	SystemDao systemDao;

	public UserInfo selectUser(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return systemDao.selectUser(userInfo);
	}

	public UserInfo findUserName(String userName) {
		// TODO Auto-generated method stub
		return systemDao.findUserName(userName);
	}

	public int saveUserRegister(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return systemDao.saveUserRegister(userInfo);
	}



}
