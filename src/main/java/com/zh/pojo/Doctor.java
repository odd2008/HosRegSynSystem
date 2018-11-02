package com.zh.pojo;

/**
 * 医生表
 * @author zh
 * @date   2018年11月2日
 */
public class Doctor {
	// 医生ID
	private String did;
	// 部门ID
	private String deptid;
	// 医生姓名
	private String dname;
	// 医生职称
	private String dtitle;
	// 医生照片地址
	private String durl;
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getDeptid() {
		return deptid;
	}
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDtitle() {
		return dtitle;
	}
	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}
	public String getDurl() {
		return durl;
	}
	public void setDurl(String durl) {
		this.durl = durl;
	}
	public Doctor(String did, String deptid, String dname, String dtitle, String durl) {
		this.did = did;
		this.deptid = deptid;
		this.dname = dname;
		this.dtitle = dtitle;
		this.durl = durl;
	}
	public Doctor() {}
	@Override
	public String toString() {
		return "Doctor [did=" + did + ", deptid=" + deptid + ", dname=" + dname + ", dtitle=" + dtitle + ", durl="
				+ durl + "]";
	}
}
