package com.travel.bean;

import java.io.Serializable;

public class Product implements Serializable {
	private Integer pid;
    private String pimage;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pimage=" + pimage + "]";
	}
	/**
	 * @return the pid
	 */
	public Integer getPid() {
		return pid;
	}
	/**
	 * @param pid the pid to set
	 */
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	/**
	 * @return the pimage
	 */
	public String getPimage() {
		return pimage;
	}
	/**
	 * @param pimage the pimage to set
	 */
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public Product(Integer pid, String pimage) {
		super();
		this.pid = pid;
		this.pimage = pimage;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

}
