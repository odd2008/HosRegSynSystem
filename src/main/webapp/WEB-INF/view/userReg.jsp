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
					   <div>
					   <button class="layui-btn layui-btn-primary" style="margin-left: 10px;" onclick="loadDiv('C')">C</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('E')">E</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('F')">F</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('G')">G</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('H')">H</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('K')">K</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('M')">M</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('N')">N</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('P')">P</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('S')">S</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('W')">W</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('X')">X</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('Y')">Y</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('Z')">Z</button>
					   <button class="layui-btn layui-btn-primary" onclick="loadDiv('all')">查询所有</button>
					   </div>
					<div id="deptCollections"></div>
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
  	
  	// 控制选择的部门ID
  	var seleDeptId = '';
  	
  	function loadDiv(descr){
  		var deptCollections = document.getElementById("deptCollections");
  		$.ajax({
   			type:'POST',
   			url:'${pageContext.request.getContextPath()}/user/showHos.do',
   			data:{"descr":descr},
   			success:function(result){
   				var jsonStr = eval(result);
   				var text = '';
   		  		for (var i = 0; i < jsonStr.length; i++) {
   		  			text += '<div onclick="cli(this.id,this.innerHTML)" class="myDiv" id="' + "dept" + jsonStr[i].deptid + '">' + jsonStr[i].dname + '</div>';
   		  		}
   		  		deptCollections.innerHTML = text;
   			},
   		    error: function (err) {
   		    	alert("数据库异常~")
   		    }
   		}); 
  	}
  	function cli(id,value){
  		if (seleDeptId != '') {
  			var flag = confirm("您已经选择部门,是否需要重新选择？" );
  			if (flag) {
  				location.reload();
  			}
  		} else {
  			var flag = confirm("您选择的是: " + value + " , 请您继续下一步操作" );
  	 		var div = document.getElementById(id);
  	 		// 把选择的ID赋值给全局部门ID
  	 		seleDeptId = id;
  	 		document.getElementById(seleDeptId).style.backgroundColor = 'greenyellow';
  	 		loadDoctor();
  		}
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
  	
  	.myDoc{
		width: 150px;
		height: 270px;
		padding: 5px;
		border:  2px gray solid;
		text-align: center;
		background-color: #92B8B1;
	}
  </style>
</html>