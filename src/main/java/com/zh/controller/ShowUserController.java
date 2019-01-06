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

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.zh.mapper.OwnerMapper;
import com.zh.pojo.Doctor;
import com.zh.pojo.HosDept;
import com.zh.pojo.Owner;
import com.zh.pojo.PatientUser;
import com.zh.pojo.RegRecords;
import com.zh.service.HosDeptService;
import com.zh.service.PatientUserService;
import com.zh.service.RegRecordsService;
import com.zh.util.AlipayConfig;

@Controller
@RequestMapping("/user")
public class ShowUserController {

	@Autowired
	PatientUserService pService;
	
	@Autowired
	HosDeptService hService;
	
	@Autowired
	OwnerMapper omapper;
	
	@Autowired
	RegRecordsService rService;
	
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
	public String userReg(String descr, Model model,HttpServletRequest request) {
		List<HosDept> hostList = hService.findByDescr(descr);
		PatientUser pUser = (PatientUser) request.getSession().getAttribute("user");
		model.addAttribute("hosp",hostList);
		model.addAttribute("user", pUser);
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
	
	@RequestMapping("/storeOrder.do")
	@ResponseBody
	public String storeOrder(RegRecords records) {
		if (records != null) {
			Integer i = rService.insert(records);
			if (i == 0 ) {
				return "failure";
			}
		}
		return "success";
	}
	
	
	@RequestMapping("/aliPay.do")
	public String payForMoney(Model model,HttpServletRequest request,String WIDout_trade_no,String WIDtotal_amount,String WIDsubject) throws AlipayApiException {
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ WIDout_trade_no +"\"," 
				+ "\"total_amount\":\""+ WIDtotal_amount +"\"," 
				+ "\"subject\":\""+ WIDsubject +"\"," 
				+ "\"body\":\""+ "" +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		model.addAttribute("alipay", result);
		return "aliPay";
	}
	
	@RequestMapping("/aliPaySuccessful.do")
	public String aliPaySuccess(Model model,HttpServletRequest request,String trade_no,String out_trade_no,String total_amount) {
		// 更新为已支付
		if (out_trade_no != null) {
			// 先检查是否是为未支付，更改其状态
			RegRecords regRecords = rService.findByOrderid(out_trade_no);
			if (("未支付").equals(regRecords.getIspay())) {
				// 如果是查出来是未支付，就获取旧对象，修改其信用度和欠款
				PatientUser pUser = (PatientUser) request.getSession().getAttribute("user");
				String pid = pUser.getPid();
				Integer pmoney = Integer.valueOf(pUser.getPmoney()) - Integer.valueOf(regRecords.getMoney());
				Integer pcredit = Integer.valueOf(pUser.getPcredit()) + 10;
				pService.updateMoney(pcredit+"", pmoney+"", pid);
				// 生成新对象
				PatientUser newUser = pService.login(pUser);
				request.getSession().setAttribute("user", newUser);
			}
			// 再更新为已支付
			Integer i = rService.update(out_trade_no);
			model.addAttribute("out_trade_no", out_trade_no);
		}
		PatientUser pUser = (PatientUser) request.getSession().getAttribute("user");
		List<RegRecords> rList = rService.findByPid(pUser.getPid());
		model.addAttribute("rList", rList);
		return "aliPaySuccessful";
	}
	
	@RequestMapping("/applyFor.do")
	@ResponseBody
	public String applyFor(HttpServletRequest request,String money) {
		// 获取原对象
		PatientUser pUser = (PatientUser) request.getSession().getAttribute("user");
		String pid = pUser.getPid();
		Integer pmoney = Integer.valueOf(pUser.getPmoney()) + Integer.valueOf(money);
		Integer pcredit = Integer.valueOf(pUser.getPcredit()) - 10;
		
		if (pcredit >= 70) {
			// 更新数据
			pService.updateMoney(pcredit+"", pmoney+"", pid);
			// 生成新对象
			PatientUser newUser = pService.login(pUser);
			request.getSession().setAttribute("user", newUser);
		} else {
			return "failure";
		}
		return "success";
	}
}
