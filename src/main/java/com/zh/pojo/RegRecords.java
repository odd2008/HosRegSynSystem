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
	// 部门名称
	private String dname;
	// 医生名称
	private String docname;
	// 预约挂号时间
	private String tardate;
	// 订单ID
	private String orderid;
	// 金额
	private String money;
	// 是否缴费
	private String ispay;
	
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
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDocname() {
		return docname;
	}
	public void setDocname(String docname) {
		this.docname = docname;
	}
	public String getTardate() {
		return tardate;
	}
	public void setTardate(String tardate) {
		this.tardate = tardate;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getIspay() {
		return ispay;
	}
	public void setIspay(String ispay) {
		this.ispay = ispay;
	}
	@Override
	public String toString() {
		return "RegRecords [rid=" + rid + ", pid=" + pid + ", dname=" + dname + ", docname=" + docname + ", tardate="
				+ tardate + ", orderid=" + orderid + ", money=" + money + ", ispay=" + ispay + "]";
	}
	
}
