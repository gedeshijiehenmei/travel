package com.travel.bean;

public class ItineraryRouteInfo {
	
	private int id;
	private String scenicSpotid;
	private String days;
	private String title;
	private String introduce;
	private String photo;
	private String photo2;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ItineraryRouteInfo [id=" + id + ", scenicSpotid=" + scenicSpotid + ", days=" + days + ", title=" + title
				+ ", introduce=" + introduce + ", photo=" + photo + ", photo2=" + photo2 + "]";
	}
	public ItineraryRouteInfo(int id, String scenicSpotid, String days, String title, String introduce, String photo,
			String photo2) {
		super();
		this.id = id;
		this.scenicSpotid = scenicSpotid;
		this.days = days;
		this.title = title;
		this.introduce = introduce;
		this.photo = photo;
		this.photo2 = photo2;
	}
	public ItineraryRouteInfo() {
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
	 * @return the scenicSpotid
	 */
	public String getScenicSpotid() {
		return scenicSpotid;
	}
	/**
	 * @param scenicSpotid the scenicSpotid to set
	 */
	public void setScenicSpotid(String scenicSpotid) {
		this.scenicSpotid = scenicSpotid;
	}
	/**
	 * @return the days
	 */
	public String getDays() {
		return days;
	}
	/**
	 * @param days the days to set
	 */
	public void setDays(String days) {
		this.days = days;
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
	 * @return the introduce
	 */
	public String getIntroduce() {
		return introduce;
	}
	/**
	 * @param introduce the introduce to set
	 */
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	/**
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}
	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	/**
	 * @return the photo2
	 */
	public String getPhoto2() {
		return photo2;
	}
	/**
	 * @param photo2 the photo2 to set
	 */
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}

}
