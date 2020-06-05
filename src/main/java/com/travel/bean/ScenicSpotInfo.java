package com.travel.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ScenicSpotInfo {
private int id;
private String name;
private String introduction;
private String city;
private String photo;
private String day;
private String ticket;
private String type;
private String balance;
private String remarks;
/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "ScenicSpotInfo [id=" + id + ", name=" + name + ", introduction=" + introduction + ", city=" + city
			+ ", photo=" + photo + ", day=" + day + ", ticket=" + ticket + ", type=" + type + ", balance=" + balance
			+ ", remarks=" + remarks + "]";
}
public ScenicSpotInfo(int id, String name, String introduction, String city, String photo, String day, String ticket,
		String type, String balance, String remarks) {
	super();
	this.id = id;
	this.name = name;
	this.introduction = introduction;
	this.city = city;
	this.photo = photo;
	this.day = day;
	this.ticket = ticket;
	this.type = type;
	this.balance = balance;
	this.remarks = remarks;
}
public ScenicSpotInfo() {
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
 * @return the city
 */
public String getCity() {
	return city;
}
/**
 * @param city the city to set
 */
public void setCity(String city) {
	this.city = city;
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
 * @return the day
 */
public String getDay() {
	return day;
}
/**
 * @param day the day to set
 */
public void setDay(String day) {
	this.day = day;
}
/**
 * @return the ticket
 */
public String getTicket() {
	return ticket;
}
/**
 * @param ticket the ticket to set
 */
public void setTicket(String ticket) {
	this.ticket = ticket;
}
/**
 * @return the type
 */
public String getType() {
	return type;
}
/**
 * @param type the type to set
 */
public void setType(String type) {
	this.type = type;
}
/**
 * @return the balance
 */
public String getBalance() {
	return balance;
}
/**
 * @param balance the balance to set
 */
public void setBalance(String balance) {
	this.balance = balance;
}
/**
 * @return the remarks
 */
public String getRemarks() {
	return remarks;
}
/**
 * @param remarks the remarks to set
 */
public void setRemarks(String remarks) {
	this.remarks = remarks;
}


}
