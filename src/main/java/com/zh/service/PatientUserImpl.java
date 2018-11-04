package com.zh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zh.mapper.PatientUserMapper;
import com.zh.pojo.PatientUser;

@Service
public class PatientUserImpl implements PatientUserService {
	
	@Autowired
	PatientUserMapper pMapper;
	
	@Override
	public boolean insetrtPatientUser(PatientUser pUser) {
		int i = pMapper.insertPatientUser(pUser);
		if(i > 0) {
			return true;
		}
		return false;
	}

	@Override
	public PatientUser login(PatientUser pUser) {
		return pMapper.login(pUser);
	}

	@Override
	public boolean update(PatientUser pUser) {
		int i = pMapper.update(pUser);
		if(i > 0) {
			return true;
		}
		return false;
	}

}
