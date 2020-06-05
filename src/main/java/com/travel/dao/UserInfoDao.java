package com.travel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.travel.bean.Product;
import com.travel.bean.UserInfo;

public interface UserInfoDao {


	List<UserInfo> selectAllUser(UserInfo userInfo);

	int doSaveUserInfo(UserInfo userInfo);

	UserInfo findUserId(Integer id);
	/*游客信息更新*/
	void updateUserInfo(UserInfo userInfo);

	void deleteuserInfoByid(Integer id);


	void doStateById(UserInfo userInfo);


	
}
