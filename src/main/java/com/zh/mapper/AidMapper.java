package com.zh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zh.pojo.Adisease;
import com.zh.pojo.Aidtable;

public interface AidMapper {
	
	@Select("select aid,adesc,acontent from aidtable where aid = #{aid}")
	Aidtable findByaid(@Param("aid") Integer aid);
	
	@Select("select aid,adesc,acontent from aidtable limit #{page},#{lim}")
	List<Aidtable> findAll(@Param("page") int page , @Param("lim")int limit);
	
	@Select("select count(aid) from aidtable")
	Integer count();
	
}
