package com.zh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zh.mapper.AidMapper;
import com.zh.pojo.Adisease;
import com.zh.pojo.Aidtable;
import com.zh.service.AidService;

@Service
public class AidServiceImpl implements AidService {
	
	@Autowired
	AidMapper aMapper;
	
	@Override
	public Aidtable findByaid(Integer aid) {
		return aMapper.findByaid(aid);
	}

	@Override
	public List<Aidtable> findAll(Integer page,Integer limit) {
		return aMapper.findAll(page,limit);
	}

	@Override
	public Integer count() {
		return aMapper.count();
	}
}
