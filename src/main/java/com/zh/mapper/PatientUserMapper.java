package com.zh.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.zh.pojo.PatientUser;

public interface PatientUserMapper {
	
	@Insert("insert into patientuser values(null,#{purl},#{pname},#{password},#{psex},#{pdate},null,#{ptel},#{pcard},'100','0',null,null,null)")
	public Integer insertPatientUser(PatientUser pUser);
	
	@Select("select pid,purl,pname,password,psex,pdate,phistory,ptel,pcard,pcredit,pmoney from patientuser where pname=#{pname} and password=#{password}")
	public PatientUser login(PatientUser pUser);
}
