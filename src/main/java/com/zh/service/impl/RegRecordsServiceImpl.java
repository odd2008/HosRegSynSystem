package com.zh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zh.mapper.RegRecordsMapper;
import com.zh.pojo.RegRecords;
import com.zh.service.RegRecordsService;

@Service
public class RegRecordsServiceImpl implements RegRecordsService {
	
	@Autowired
	RegRecordsMapper rMapper;
	
	@Override
	public List<RegRecords> findByPid(String pid) {
		return rMapper.findByPid(pid);
	}

	@Override
	public RegRecords findByOrderid(String orderid) {
		return rMapper.findByOrderid(orderid);
	}

	@Override
	public Integer insert(RegRecords records) {
		return rMapper.insert(records);
	}

	@Override
	public Integer update(String orderid) {
		return rMapper.update(orderid);
	}

	@Override
	public Integer addEvaluate(String rid, String evaluate) {
		return rMapper.addEvaluate(rid, evaluate);
	}

}
