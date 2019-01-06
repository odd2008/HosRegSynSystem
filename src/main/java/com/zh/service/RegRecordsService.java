package com.zh.service;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.zh.pojo.RegRecords;

public interface RegRecordsService {
	/**
	 * 根据pid找订单
	 * @param pid
	 * @return
	 */
	public List<RegRecords> findByPid(String pid);
	
	/**
	 * 根据orderid找订单
	 * @param orderid
	 * @return
	 */
	public RegRecords findByOrderid(String orderid);
	
	/**
	 * 添加数据
	 * @param records
	 * @return
	 */
	public Integer insert(RegRecords records);
	
	/***
	 * 修改为已支付
	 * @param orderid
	 * @return
	 */
	public Integer update(String  orderid);
	
	/**
	 * 添加评价
	 * @param rid
	 * @param evaluate
	 * @return
	 */
	public Integer addEvaluate(String rid, String evaluate);
}
