package com.zh.pojo;

/**
 * 挂号记录表
 * @author zh
 * @date   2018年11月2日
 */
public class RegRecords {
	// 挂号ID
	private String rid;
	// 用户ID
	private String pid;
	// 部门ID
	private String deptid;
	// 医生ID
	private String did;
	// 简要说明
	private String explain;
	// 预约挂号时间
	private String tardate;
	// 当前执行操作的时间
	private String nowdate;
	// 是否按时就诊
	private String flag;
	// 是否缴费
	private String ismoney;
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getDeptid() {
		return deptid;
	}
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getTardate() {
		return tardate;
	}
	public void setTardate(String tardate) {
		this.tardate = tardate;
	}
	public String getNowdate() {
		return nowdate;
	}
	public void setNowdate(String nowdate) {
		this.nowdate = nowdate;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getIsmoney() {
		return ismoney;
	}
	public void setIsmoney(String ismoney) {
		this.ismoney = ismoney;
	}
	public RegRecords(String rid, String pid, String deptid, String did, String explain, String tardate, String nowdate,
			String flag, String ismoney) {
		super();
		this.rid = rid;
		this.pid = pid;
		this.deptid = deptid;
		this.did = did;
		this.explain = explain;
		this.tardate = tardate;
		this.nowdate = nowdate;
		this.flag = flag;
		this.ismoney = ismoney;
	}
	public RegRecords() {
		super();
	}
	@Override
	public String toString() {
		return "RegRecords [rid=" + rid + ", pid=" + pid + ", deptid=" + deptid + ", did=" + did + ", explain="
				+ explain + ", tardate=" + tardate + ", nowdate=" + nowdate + ", flag=" + flag + ", ismoney=" + ismoney
				+ "]";
	}
}
