package com.zh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.zh.pojo.RegRecords;

public interface RegRecordsMapper {
	
	@Select("select rid,dname,docname,tardate,orderid,money,ispay,evaluate from regrecords where pid = #{pid} order by tardate desc")
	public List<RegRecords> findByPid(String pid);
	
	@Select("select rid,pid,dname,docname,tardate,money,ispay from regrecords where orderid = #{orderid} ")
	public RegRecords findByOrderid(String orderid);
	
	@Insert("insert into regrecords values(null,#{pid},#{dname},#{docname},#{tardate},#{orderid},#{money},'未支付')")
	public Integer insert(RegRecords records);
	
	@Update("update regrecords set ispay='已支付' where orderid = #{orderid}")
	public Integer update(String  orderid);
	
	@Update("update regrecords set evaluate = #{evaluate} where rid = #{rid}")
	public Integer addEvaluate(@Param(value = "rid") String rid, @Param(value = "evaluate") String evaluate);
}
