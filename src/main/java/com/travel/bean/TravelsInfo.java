package com.travel.bean;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TravelsInfo {

	private int id;
	private String userid;
	private String title;
	private String cover;
	private String text;
	private String introduction;
	private String fabulous;
	private String commentid;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creationtime;
	private List<UserInfo> userInfo;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "TravelsInfo [id=" + id + ", userid=" + userid + ", title=" + title + ", cover=" + cover + ", text="
				+ text + ", introduction=" + introduction + ", fabulous=" + fabulous + ", commentid=" + commentid
				+ ", creationtime=" + creationtime + ", userInfo=" + userInfo + "]";
	}
	public TravelsInfo(int id, String userid, String title, String cover, String text, String introduction,
			String fabulous, String commentid, Date creationtime, List<UserInfo> userInfo) {
		super();
		this.id = id;
		this.userid = userid;
		this.title = title;
		this.cover = cover;
		this.text = text;
		this.introduction = introduction;
		this.fabulous = fabulous;
		this.commentid = commentid;
		this.creationtime = creationtime;
		this.userInfo = userInfo;
	}
	public TravelsInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
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
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the cover
	 */
	public String getCover() {
		return cover;
	}
	/**
	 * @param cover the cover to set
	 */
	public void setCover(String cover) {
		this.cover = cover;
	}
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * @return the introduction
	 */
	public String getIntroduction() {
		return introduction;
	}
	/**
	 * @param introduction the introduction to set
	 */
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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
	 * @return the commentid
	 */
	public String getCommentid() {
		return commentid;
	}
	/**
	 * @param commentid the commentid to set
	 */
	public void setCommentid(String commentid) {
		this.commentid = commentid;
	}
	/**
	 * @return the creationtime
	 */
	public Date getCreationtime() {
		return creationtime;
	}
	/**
	 * @param creationtime the creationtime to set
	 */
	public void setCreationtime(Date creationtime) {
		this.creationtime = creationtime;
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

	
	
}
