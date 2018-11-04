package com.zh.service;

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
}
