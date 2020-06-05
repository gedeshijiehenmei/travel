package com.travel.bean;

import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.util.StringUtil;

/**
 * 通用返回的类
 * 
 */
public class Msg {
	// 状态码 100成功200失败
	private int code;
//提示信息
	private String message;
//用户要返回浏览器的数据(链式)
	private Map<String, Object> extend = new HashMap<String, Object>();

	public static Msg success() {
		Msg result = new Msg();

		result.setCode(100);
		result.setMessage("处理成功");
		return result;

	}

	public static Msg fail(String string) {
		Msg result = new Msg();

		result.setCode(200);
		if(StringUtil.isEmpty(string)) {
			result.setMessage("处理失败");
			
		}else {
			result.setMessage(string);
		}
		return result;
	}

	public Msg add(String key, Object value) {
		this.getExtend().put(key, value);
		return this;

	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

	
}
