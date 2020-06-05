package com.travel.bean;

public class ReservationInfo {

	
	private int xzid;
	private String xztitle;
	private String xztext;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ReservationInfo [xzid=" + xzid + ", xztitle=" + xztitle + ", xztext=" + xztext + "]";
	}
	public ReservationInfo(int xzid, String xztitle, String xztext) {
		super();
		this.xzid = xzid;
		this.xztitle = xztitle;
		this.xztext = xztext;
	}
	public ReservationInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the xzid
	 */
	public int getXzid() {
		return xzid;
	}
	/**
	 * @param xzid the xzid to set
	 */
	public void setXzid(int xzid) {
		this.xzid = xzid;
	}
	/**
	 * @return the xztitle
	 */
	public String getXztitle() {
		return xztitle;
	}
	/**
	 * @param xztitle the xztitle to set
	 */
	public void setXztitle(String xztitle) {
		this.xztitle = xztitle;
	}
	/**
	 * @return the xztext
	 */
	public String getXztext() {
		return xztext;
	}
	/**
	 * @param xztext the xztext to set
	 */
	public void setXztext(String xztext) {
		this.xztext = xztext;
	}
	
	
	
}
