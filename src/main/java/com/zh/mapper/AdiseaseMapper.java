package com.zh.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Select;
import com.zh.pojo.Adisease;

public interface AdiseaseMapper {
	
	@Select("select aname,adescr from adisease")
	List<Adisease> findAll();
	
}
