package com.zh.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zh.pojo.PatientUser;
import com.zh.service.PatientUserService;
import com.zh.service.RegRecordsService;

@Controller
@RequestMapping("/patient")
public class PatientUserConteoller {
	
	@Autowired
	PatientUserService pService;
	
	@Autowired
	RegRecordsService rService;
	
	@RequestMapping("/add.do")
	@ResponseBody
	public String insert(PatientUser pUser) {
		System.out.println(pUser);
		boolean b = pService.insetrtPatientUser(pUser);
		if(b) {
			return "success";
		}
		return "failure";
	}
	
	@RequestMapping("/login.do")
	@ResponseBody
	public String login(PatientUser pUser,HttpServletRequest request) {
		PatientUser newUser = pService.login(pUser);
		if(newUser != null) {
			request.getSession().setAttribute("user", newUser);
			return "success";
		}
		return "failure";
	}
	
	@RequestMapping("/updatePassword.do")
	@ResponseBody
	public String updatePassword(String pname,String purl) {
		Integer i = pService.updatePassword(purl, pname);
		if(i == 0) {
			return "failure";
		}
		return "success";
	}
	
	@RequestMapping("/userEvaluate.do")
	public String userEvaluate(String rid, Model m) {
		m.addAttribute("rid", rid);
		return "userEvaluate";
	}
	
	@RequestMapping("/addEvaluate.do")
	@ResponseBody
	public String addEvaluate(String rid, String evaluate) {
		Integer i = rService.addEvaluate(rid, evaluate);
		if(i == 0) {
			return "failure";
		}
		return "success";
	}
}
