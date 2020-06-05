package com.travel.bean;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentInfo {
	
	private int pid;
	private String userid;
	private String scenicSpotName;
	private List<UserInfo> userInfo;
	private List<ScenicSpotInfo> scenicSpotInfo;
	private String dindanid;
	private String content;
	private String fraction;
	private String fabulous;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date commentaryTime;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CommentInfo [pid=" + pid + ", userid=" + userid + ", scenicSpotName=" + scenicSpotName + ", userInfo="
				+ userInfo + ", scenicSpotInfo=" + scenicSpotInfo + ", dindanid=" + dindanid + ", content=" + content
				+ ", fraction=" + fraction + ", fabulous=" + fabulous + ", commentaryTime=" + commentaryTime + "]";
	}
	public CommentInfo(int pid, String userid, String scenicSpotName, List<UserInfo> userInfo,
			List<ScenicSpotInfo> scenicSpotInfo, String dindanid, String content, String fraction, String fabulous,
			Date commentaryTime) {
		super();
		this.pid = pid;
		this.userid = userid;
		this.scenicSpotName = scenicSpotName;
		this.userInfo = userInfo;
		this.scenicSpotInfo = scenicSpotInfo;
		this.dindanid = dindanid;
		this.content = content;
		this.fraction = fraction;
		this.fabulous = fabulous;
		this.commentaryTime = commentaryTime;
	}
	public CommentInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the pid
	 */
	public int getPid() {
		return pid;
	}
	/**
	 * @param pid the pid to set
	 */
	public void setPid(int pid) {
		this.pid = pid;
	}
	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	 * @return the scenicSpotName
	 */
	public String getScenicSpotName() {
		return scenicSpotName;
	}
	/**
	 * @param scenicSpotName the scenicSpotName to set
	 */
	public void setScenicSpotName(String scenicSpotName) {
		this.scenicSpotName = scenicSpotName;
	}
	/**
	 * @return the userInfo
	 */
	public List<UserInfo> getUserInfo() {
		return userInfo;
	}
	/**
	 * @param userInfo the userInfo to set
	 */
	public void setUserInfo(List<UserInfo> userInfo) {
		this.userInfo = userInfo;
	}
	/**
	 * @return the scenicSpotInfo
	 */
	public List<ScenicSpotInfo> getScenicSpotInfo() {
		return scenicSpotInfo;
	}
	/**
	 * @param scenicSpotInfo the scenicSpotInfo to set
	 */
	public void setScenicSpotInfo(List<ScenicSpotInfo> scenicSpotInfo) {
		this.scenicSpotInfo = scenicSpotInfo;
	}
	/**
	 * @return the dindanid
	 */
	public String getDindanid() {
		return dindanid;
	}
	/**
	 * @param dindanid the dindanid to set
	 */
	public void setDindanid(String dindanid) {
		this.dindanid = dindanid;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the fraction
	 */
	public String getFraction() {
		return fraction;
	}
	/**
	 * @param fraction the fraction to set
	 */
	public void setFraction(String fraction) {
		this.fraction = fraction;
	}
	/**
	 * @return the fabulous
	 */
	public String getFabulous() {
		return fabulous;
	}
	/**
	 * @param fabulous the fabulous to set
	 */
	public void setFabulous(String fabulous) {
		this.fabulous = fabulous;
	}
	/**
	 * @return the commentaryTime
	 */
	public Date getCommentaryTime() {
		return commentaryTime;
	}
	/**
	 * @param commentaryTime the commentaryTime to set
	 */
	public void setCommentaryTime(Date commentaryTime) {
		this.commentaryTime = commentaryTime;
	}

}
