package com.zh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.zh.pojo.RegRecords;

public interface RegRecordsMapper {
	
	@Select("select rid,dname,docname,tardate,orderid,money,ispay from regrecords where pid = #{pid} ")
	public List<RegRecords> findByPid(String pid);
	
	@Select("select rid,pid,dname,docname,tardate,money,ispay from regrecords where orderid = #{orderid} ")
	public List<RegRecords> findByOrderid(String orderid);
	
	@Insert("insert into regrecords values(null,#{pid},#{dname},#{docname},#{tardate},#{orderid},#{money},'未支付')")
	public Integer insert(RegRecords records);
	
	@Update("update regrecords set ispay='已支付' where orderid = #{orderid}")
	public Integer update(String  orderid);
}
