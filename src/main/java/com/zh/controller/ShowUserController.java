package com.zh.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zh.pojo.PatientUser;
import com.zh.service.PatientUserService;

@Controller
@RequestMapping("/user")
public class ShowUserController {
	
	@Autowired
	PatientUserService pService;
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
		PatientUser pUser = (PatientUser) request.getSession().getAttribute("user");
		if(pUser == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return null;
		}
		model.addAttribute("user", pUser);
		return "index";
	}
	
	@RequestMapping("/welcome.do")
	public String welcome(Model model,HttpServletRequest request) throws IOException {
		PatientUser pUser = (PatientUser) request.getSession().getAttribute("user");
		model.addAttribute("user", pUser);
		return "welcome";
	}
	
	@RequestMapping("/userEdit.do")
	public String userEdit(Model model,HttpServletRequest request) throws IOException {
		PatientUser pUser = (PatientUser) request.getSession().getAttribute("user");
		model.addAttribute("user", pUser);
		return "userEdit";
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String update(PatientUser pUser,HttpServletRequest request) {
		PatientUser patientUser = (PatientUser) request.getSession().getAttribute("user");
		patientUser.setPassword(pUser.getPassword());
		patientUser.setPtel(pUser.getPtel());
		boolean b = pService.update(patientUser);
		if(b) {
			return "success";
		}
		return "failure";
	}
	
	@RequestMapping("/userShow.do")
	public String userShow(Model model,HttpServletRequest request) throws IOException {
		PatientUser pUser = (PatientUser) request.getSession().getAttribute("user");
		model.addAttribute("user", pUser);
		return "userShow";
	}
	
	@RequestMapping("/hospShow.do")
	public String hospShow() {
		return "hospShow";
	}
	
	@RequestMapping("/hproShow.do")
	public String hproShow() {
		return "hproShow";
	}
}
