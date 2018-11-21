package com.zh.pojo;

/***
 * 病人用户类
 * @author zh
 * @date   2018年11月2日
 */
public class PatientUser {
	// 用户ID
	private String pid;
	// 用户密保问题答案
	private String purl;
	// 用户姓名
	private String pname;
	// 用户密码
	private String password;
	// 用户性别
	private String psex;
	// 用户出生日期
	private String pdate;
	// 用户病史
	private String phistory;
	// 用户电话
	private String ptel;
	// 用户身份证
	private String pcard;
	// 用户信用度
	private String pcredit;
	// 用户欠费金额
	private String pmoney;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPurl() {
		return purl;
	}
	public void setPurl(String purl) {
		this.purl = purl;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPsex() {
		return psex;
	}
	public void setPsex(String psex) {
		this.psex = psex;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPhistory() {
		return phistory;
	}
	public void setPhistory(String phistory) {
		this.phistory = phistory;
	}
	public String getPtel() {
		return ptel;
	}
	public void setPtel(String ptel) {
		this.ptel = ptel;
	}
	public String getPcard() {
		return pcard;
	}
	public void setPcard(String pcard) {
		this.pcard = pcard;
	}
	public String getPcredit() {
		return pcredit;
	}
	public void setPcredit(String pcredit) {
		this.pcredit = pcredit;
	}
	public String getPmoney() {
		return pmoney;
	}
	public void setPmoney(String pmoney) {
		this.pmoney = pmoney;
	}
	public PatientUser(String pid, String pname, String psex, String pdate, String phistory, String ptel, String pcard,
			String pcredit, String pmoney) {
		this.pid = pid;
		this.pname = pname;
		this.psex = psex;
		this.pdate = pdate;
		this.phistory = phistory;
		this.ptel = ptel;
		this.pcard = pcard;
		this.pcredit = pcredit;
		this.pmoney = pmoney;
	}
	public PatientUser() {}
	@Override
	public String toString() {
		return "PatientUser [pid=" + pid + ", purl=" + purl + ", pname=" + pname + ", password=" + password + ", psex="
				+ psex + ", pdate=" + pdate + ", phistory=" + phistory + ", ptel=" + ptel + ", pcard=" + pcard
				+ ", pcredit=" + pcredit + ", pmoney=" + pmoney + "]";
	}
}
