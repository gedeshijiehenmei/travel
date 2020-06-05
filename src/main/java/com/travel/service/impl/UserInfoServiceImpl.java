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
import com.travel.dao.UserInfoDao;
import com.travel.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	UserInfoDao userInfoDao;


	//查询所有用户信息
	public List<UserInfo> getAllUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoDao.selectAllUser(userInfo);
	}

	// 检验用户名是否可用
	public boolean checkuser(String userName) {
		// TODO Auto-generated method stub
		/*
		 * EmployeeExample example=new EmployeeExample(); Criteria criteria =
		 * example.createCriteria(); criteria.andEmpNameEqualTo(empName); long
		 * count=employeeMapper.countByExample(example); return count==0;
		 */
		return false;
	}

	public int doSaveUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoDao.doSaveUserInfo(userInfo);
		
	}

	public UserInfo findUserId(Integer id) {
		// TODO Auto-generated method stub
		return userInfoDao.findUserId(id);
	}

	/* 游客信息更新 */
	public void updateUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		userInfoDao.updateUserInfo(userInfo);

	}
	// 游客信息删除

	public void deleteuserInfoByid(Integer id) {
		// TODO Auto-generated method stub
		userInfoDao.deleteuserInfoByid(id);

	}


	public void doStateById(UserInfo userInfo) {
		// TODO Auto-generated method stub
		 userInfoDao.doStateById(userInfo);
	}






}
