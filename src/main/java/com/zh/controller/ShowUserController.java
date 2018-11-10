package com.zh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zh.mapper.OwnerMapper;
import com.zh.pojo.Doctor;
import com.zh.pojo.HosDept;
import com.zh.pojo.Owner;
import com.zh.pojo.PatientUser;
import com.zh.service.HosDeptService;
import com.zh.service.PatientUserService;

@Controller
@RequestMapping("/user")
public class ShowUserController {
	
	@Autowired
	PatientUserService pService;
	
	@Autowired
	HosDeptService hService;
	
	@Autowired
	OwnerMapper omapper;
	
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
		Owner admin = omapper.findOne();
		model.addAttribute("user", pUser);
		model.addAttribute("admin", admin);
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
	
	/*****************  挂号相关  *****************/
	@RequestMapping("/userReg.do")
	public String userReg(String descr, Model model) {
		List<HosDept> hostList = hService.findByDescr(descr);
		model.addAttribute("hosp",hostList);
		return "userReg";
	}
	
	@RequestMapping("/showHos.do")
	@ResponseBody
	public List<HosDept> showHos(String descr) {
		if ("all".equals(descr)) {
			descr = null;
		}
		List<HosDept> hostList = hService.findByDescr(descr);
		return hostList;
	}
	
	/***
	 * 显示当前科室下医生
	 * @param deptid
	 * @return
	 */
	@RequestMapping("/showDoctors.do")
	@ResponseBody
	public List<Doctor> showDoctors(String deptid) {
		List<Doctor> doctorList = hService.findByDeptId(deptid);
		return doctorList;
	}
}
