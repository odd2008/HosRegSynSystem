package com.zh.pojo;

import java.util.List;

/***
 * 医院部门表
 * @author zh
 * @date   2018年11月2日
 */
public class HosDept {
	// 部门ID
	private String deptid;
	// 部门描述
	private String descr;
	// 部门名称
	private String dname;
	// 所属部门医生集合
	private List<Doctor> doctors;
	public String getDeptid() {
		return deptid;
	}
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public List<Doctor> getDoctors() {
		return doctors;
	}
	public void setDoctors(List<Doctor> doctors) {
		this.doctors = doctors;
	}
	public HosDept(String deptid, String descr, String dname, List<Doctor> doctors) {
		super();
		this.deptid = deptid;
		this.descr = descr;
		this.dname = dname;
		this.doctors = doctors;
	}
	public HosDept() {
		super();
	}
	@Override
	public String toString() {
		return "HosDept [deptid=" + deptid + ", descr=" + descr + ", dname=" + dname + ", doctors=" + doctors + "]";
	}
}
