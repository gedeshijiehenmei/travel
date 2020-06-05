package com.travel.bean;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Order {
	private int id;
	private String userName;//用户昵称
	private String name;//景点名称
	private String number;//人数
	private String total;//总价
	private String state;//状态
	private String phone;
	private String contacts;
	private String daoyou;
	private String departureTime;//预定时间
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creationTime;//下单时间
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Order [id=" + id + ", userName=" + userName + ", name=" + name + ", number=" + number + ", total="
				+ total + ", state=" + state + ", phone=" + phone + ", contacts=" + contacts + ", daoyou=" + daoyou
				+ ", departureTime=" + departureTime + ", creationTime=" + creationTime + "]";
	}
	public Order(int id, String userName, String name, String number, String total, String state, String phone,
			String contacts, String daoyou, String departureTime, Date creationTime) {
		super();
		this.id = id;
		this.userName = userName;
		this.name = name;
		this.number = number;
		this.total = total;
		this.state = state;
		this.phone = phone;
		this.contacts = contacts;
		this.daoyou = daoyou;
		this.departureTime = departureTime;
		this.creationTime = creationTime;
	}
	public Order() {
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
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the number
	 */
	public String getNumber() {
		return number;
	}
	/**
	 * @param number the number to set
	 */
	public void setNumber(String number) {
		this.number = number;
	}
	/**
	 * @return the total
	 */
	public String getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(String total) {
		this.total = total;
	}
	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the contacts
	 */
	public String getContacts() {
		return contacts;
	}
	/**
	 * @param contacts the contacts to set
	 */
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	/**
	 * @return the daoyou
	 */
	public String getDaoyou() {
		return daoyou;
	}
	/**
	 * @param daoyou the daoyou to set
	 */
	public void setDaoyou(String daoyou) {
		this.daoyou = daoyou;
	}
	/**
	 * @return the departureTime
	 */
	public String getDepartureTime() {
		return departureTime;
	}
	/**
	 * @param departureTime the departureTime to set
	 */
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	/**
	 * @return the creationTime
	 */
	public Date getCreationTime() {
		return creationTime;
	}
	/**
	 * @param creationTime the creationTime to set
	 */
	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	
	
}
