<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
  </head>
  
  <body style="padding: 15px;" onload="loadDiv()">
	  <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			  <ul class="layui-tab-title">
				    <li class="layui-this" id="l1">查找科室</li>
				    <li id="l2">查找医生</li>
				    <li id="l3">信息确认</li>
				    <li id="l4">挂号缴费</li>
			  </ul>
			  <div class="layui-tab-content">
						<div class="layui-tab-item layui-show" id="show1">
						</div>
				    <div class="layui-tab-item" id="show2">
				    	您尚未选择科室！
				    </div>
				    <div class="layui-tab-item" id="show3">内容3</div>
				    <div class="layui-tab-item" id="show4">内容4</div>
		  	</div>
	  </div>    
  </body>
  <script type="text/javascript">
  	var show1 = document.getElementById("show1");
  	var show2 = document.getElementById("show2");
  	var show3 = document.getElementById("show3");
  	var show4 = document.getElementById("show4");
  	function loadDiv(){
	  		var text = '';
	  		for (var i = 0;i < 32;i++) {
	  			text += '<div onclick="cli(this.id,this.innerHTML)" class="myDiv" id="d">' + i + '</div>';
	  		}
	  		show1.innerHTML = text;
  	}
  	function cli(id,value){
	  		var flag = confirm("您选择的是: " + value + " , 请您继续下一步操作" );
  			var div = document.getElementById(id);
  			div.style.backgroundColor = 'greenyellow';
  			loadDoctor();
  	}
  	function loadDoctor(){
	  		var text = '';
	  		for (var i = 0;i < 5;i++) {
	  			text += '<div onclick="" class="myDiv" id="d">' + i + '</div>';
	  		}
	  		show2.innerHTML = text;
  	}
  </script>
  <style type="text/css">
  	.myDiv{
  		float: left;
  		width: 160px;
  		height: 60px;
  		background-color: lightblue;
  		font-family: "微软雅黑";
  		font-size: 18px;
  		font: bold;
  		text-align: center;
  		line-height: 60px;
  		margin: 10px;
  		border-radius: 8px;
  		cursor: pointer;
  	}
  </style>
</html>