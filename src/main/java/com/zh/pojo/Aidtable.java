package com.zh.pojo;

public class Aidtable {
	private String aid;
	private String adesc;
	private String acontent;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAdesc() {
		return adesc;
	}
	public void setAdesc(String adesc) {
		this.adesc = adesc;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	@Override
	public String toString() {
		return "Aid [aid=" + aid + ", adesc=" + adesc + ", acontent=" + acontent + "]";
	}
	
}
