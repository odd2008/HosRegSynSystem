package com.zh.service;

import org.apache.ibatis.annotations.Param;

import com.zh.pojo.PatientUser;

public interface PatientUserService {
	
	/***
	 * 添加病人用户
	 * @param pUser
	 * @return
	 */
	boolean insetrtPatientUser(PatientUser pUser);
	
	/**
	 * 用户登录
	 * @param pUser
	 * @return
	 */
	public PatientUser login(PatientUser pUser);
	
	/***
	 * 用户修改电话，密码
	 * @param pUser
	 * @return
	 */
	public boolean update(PatientUser pUser);
	
	/**
	 * 更新欠款
	 * @param money
	 * @param pid
	 * @return
	 */
	public Integer updateMoney(String pcredit,String money,String pid);
	
	/**
	 * 重置密码
	 * @param purl
	 * @param pname
	 * @return
	 */
	public Integer updatePassword(String purl,String pname);
}
