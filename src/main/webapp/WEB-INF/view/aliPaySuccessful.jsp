<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>协和医院欢迎您</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
  	<link rel="Shortcut Icon" href="http://oa.whuh.com/static/images/trasen.ico">
  </head>
	<body style="padding: 50px;" onload="loadPay()">
		<ul class="layui-timeline">
			<c:forEach items="${rList}" var="rl">
		        <li class="layui-timeline-item">
				<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
					<div class="layui-timeline-content layui-text">
						<h3 class="layui-timeline-title">${rl.tardate}</h3>
						<p>
							科室: ${rl.dname}<span><br>
							医生: ${rl.docname}</span>
							<br><span>订单ID:&nbsp;</span>${rl.orderid}<i class="layui-icon"></i>
							<br><span>订单金额:&nbsp;</span>${rl.money}<i class="layui-icon"></i>
							<br><span>是否缴费:&nbsp;</span>${rl.ispay}<i class="layui-icon"></i>
						</p>
					</div>
				</li>   
		    </c:forEach>
		</ul>
	</body>
<script type="text/javascript">
	function loadPay(){
		var flag = '${out_trade_no}';
		if (flag != '') {
			layui.use('layer', function(){
		  		var layer = layui.layer;
				//8s后自动关闭
		  		layer.msg('你已挂号成功，请按时前往医院就诊', {
			        time: 8000, btn: ['好的']
			    });
			}); 
		}
	}
</script>
</html>