package com.zh.mapper;

import org.apache.ibatis.annotations.Select;

import com.zh.pojo.Owner;

public interface OwnerMapper {
	
	@Select("select * from owner where oid = 1")
	Owner findOne();
}
