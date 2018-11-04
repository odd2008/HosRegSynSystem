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
	private String docname;
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
	public String getDocname() {
		return docname;
	}
	public void setDocname(String docname) {
		this.docname = docname;
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
	public Doctor(String did, String deptid, String docname, String dtitle, String durl) {
		super();
		this.did = did;
		this.deptid = deptid;
		this.docname = docname;
		this.dtitle = dtitle;
		this.durl = durl;
	}
	public Doctor() {
		super();
	}
	@Override
	public String toString() {
		return "Doctor [did=" + did + ", deptid=" + deptid + ", docname=" + docname + ", dtitle=" + dtitle + ", durl="
				+ durl + "]";
	}
	
}
