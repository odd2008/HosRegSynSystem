package com.zh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zh.pojo.Doctor;
import com.zh.pojo.HosDept;

public interface HosDeptMapper {
	/**
	 * 查找医院部门
	 * @param descr
	 * @return
	 */
	public List<HosDept> findByDescr(@Param("descr")String descr);
	
	/***
	 * 按科室查找所有医生
	 * @param deptid
	 * @return
	 */
	public List<Doctor> findByDeptId(@Param("deptid")String deptid);
}
