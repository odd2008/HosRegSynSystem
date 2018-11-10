package com.zh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.zh.pojo.Aidtable;
import com.zh.service.AidService;

@Controller
@RequestMapping("/care")
public class AidController {
	
	@Autowired
	AidService aService;
	
	@RequestMapping("/aidShow.do")
	public String aidShow() {
		return "aidShow";
	}
	
	@RequestMapping("/aidContent.do")
	@ResponseBody
	public Map<String, Object> aidContent(int page,int limit) {
		int p = ( page - 1) * limit;
		List<Aidtable> list = aService.findAll(p,limit);
		Integer count = aService.count();
		Map<String, Object> map = new HashMap<>();
		map.put("code", 0);
		map.put("count", count);
		map.put("data", list);
		map.put("msg", "结果正常");
		return map;
	}
}
