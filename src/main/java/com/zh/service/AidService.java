package com.zh.service;

import java.util.List;
import com.zh.pojo.Aidtable;

public interface AidService {

	/**
	 * 按aid查找
	 * @param aid
	 * @return
	 */
	Aidtable findByaid(Integer aid);
	
	/***
	 * 查所有
	 * @return
	 */
	List<Aidtable> findAll(Integer page,Integer limit);
	
	/**
	 * 返回数据总数
	 * @return
	 */
	Integer count();
}
