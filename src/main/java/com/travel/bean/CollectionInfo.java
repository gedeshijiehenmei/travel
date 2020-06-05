package com.travel.bean;

import java.util.List;

public class CollectionInfo {
	private int id;
	private int userid;
	private int scenicSpotid;
	private List<ScenicSpotInfo> scenicSpotInfo;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	/*@Override
	public String toString() {
		return "CollectionInfo [id=" + id + ", userid=" + userid + ", scenicSpotid=" + scenicSpotid
				+ ", scenicSpotInfo=" + scenicSpotInfo + "]";
	}*/
	public CollectionInfo(int id, int userid, int scenicSpotid, List<ScenicSpotInfo> scenicSpotInfo) {
		super();
		this.id = id;
		this.userid = userid;
		this.scenicSpotid = scenicSpotid;
		this.scenicSpotInfo = scenicSpotInfo;
	}
	public CollectionInfo() {
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
	public int getUserid() {
		return userid;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(int userid) {
		this.userid = userid;
	}
	/**
	 * @return the scenicSpotid
	 */
	public int getScenicSpotid() {
		return scenicSpotid;
	}
	/**
	 * @param scenicSpotid the scenicSpotid to set
	 */
	public void setScenicSpotid(int scenicSpotid) {
		this.scenicSpotid = scenicSpotid;
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
	

}
