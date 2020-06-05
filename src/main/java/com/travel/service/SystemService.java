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

public interface SystemService {

	UserInfo selectUser(UserInfo userInfo);

	UserInfo findUserName(String userName);

	int saveUserRegister(UserInfo userInfo);

}
