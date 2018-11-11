package com.zh.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.zh.pojo.PatientUser;

public interface PatientUserMapper {
	
	@Insert("insert into patientuser values(null,#{purl},#{pname},#{password},#{psex},#{pdate},null,#{ptel},#{pcard},'100','0',null,null,null)")
	public Integer insertPatientUser(PatientUser pUser);
	
	@Select("select pid,purl,pname,password,psex,pdate,phistory,ptel,pcard,pcredit,pmoney from patientuser where pname=#{pname} and password=#{password}")
	public PatientUser login(PatientUser pUser);
	
	@Update("update patientuser set ptel=#{ptel},password=#{password} where pid=#{pid}")
	public Integer update(PatientUser pUser);
	
	@Update("update patientuser set pmoney=#{money},pcredit=#{pcredit} where pid=#{pid}")
	public Integer updateMoney(@Param("pcredit")String pcredit,@Param("money")String money,@Param("pid")String pid);
	
	@Update("update patientuser set password='123456' where pname=#{pname} and purl=#{purl}")
	public Integer updatePassword(@Param("purl")String purl,@Param("pname")String pname);
}
