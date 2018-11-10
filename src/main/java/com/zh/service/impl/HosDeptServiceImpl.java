package com.zh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zh.mapper.HosDeptMapper;
import com.zh.pojo.Doctor;
import com.zh.pojo.HosDept;
import com.zh.service.HosDeptService;

@Service
public class HosDeptServiceImpl implements HosDeptService {
	
	@Autowired
	HosDeptMapper hosMapper;
	
	@Override
	public List<HosDept> findByDescr(String descr) {
		return hosMapper.findByDescr(descr);
	}

	@Override
	public List<Doctor> findByDeptId(String deptid) {
		return hosMapper.findByDeptId(deptid);
	}

}
