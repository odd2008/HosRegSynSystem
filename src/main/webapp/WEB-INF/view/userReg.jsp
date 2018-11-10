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
			    <li id="l2" style="visibility: hidden;">查找医生</li>
			    <li id="l3" style="visibility: hidden;">信息确认</li>
			    <li id="l4" style="visibility: hidden;">挂号缴费</li>
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
			    <div class="layui-tab-item" id="show3">
			    	<div id="showdiv3" style="display: inline-block;">您尚未选择科室以及医生，请先选择</div>
			    	<fieldset class="layui-elem-field" id="hidediv3" style="display: none;">
			            <legend>身份信息</legend>
			            <div class="layui-field-box">
			                <table class="layui-table">
			                    <tbody>
			                        <tr>
			                            <th>姓名</th>
			                            <td>${user.pname}</td></tr>
			                        <tr>
			                            <th>性别</th>
			                            <td>${user.psex}</td></tr>
			                        <tr>
			                            <th>出生年月</th>
			                            <td>${user.pdate}</td></tr>
			                        <tr>
			                            <th>联系方式</th>
			                            <td>${user.ptel}</td></tr>
			                        <tr>
			                            <th>身份证</th>
			                            <td>${user.pcard}</td></tr>
			                        <tr>
			                            <th>密保答案</th>
			                            <td>${user.purl}</td></tr>    
			                        <tr>
			                            <th>当前欠费金额</th>
			                            <td>${user.pmoney}<span>&nbsp;&nbsp;元</span></td></tr>
			                    </tbody>
			                </table>
			            </div>
			            <br>
			            <div style="width: 100%;text-align: center;">
							<button onclick="conInfo()" class="layui-btn layui-btn-lg layui-btn-normal">确认无误</button>
							<button onclick="conInfoFalse()" class="layui-btn layui-btn-lg layui-btn-normal">我要修改</button>
						</div>
			        </fieldset>
			    </div>
			    <div class="layui-tab-item" id="show4">
			    	<fieldset class="layui-elem-field">
            		<legend>挂号缴费</legend>
		            <div class="layui-field-box">
		                <table class="layui-table">
		                    <tbody>
		                        <tr>
		                            <th>患者姓名:</th>
		                            <td>柯贤铭</td></tr>
		                        <tr>
		                            <th>联系方式</th>
		                            <td>13986566997</td></tr>
		                        <tr>
		                            <th>就诊科室</th>
		                            <td>内科</td></tr>
		                        <tr>
		                            <th>就诊医师</th>
		                            <td>王医生</td></tr>
		                        <tr>
		                            <th>就诊时间</th>
		                            <td>2018-11-10 下午</td></tr>
		                        <tr>
		                            <th><span style="color: red;">就诊金额</span></th>
		                            <td><span style="color: red;">18</span> 元</td></tr>
		                    </tbody>
		                </table>
		                <div style="width: 100%;text-align: center;">
							<button onclick="" class="layui-btn layui-btn-lg layui-btn-normal">立即缴费</button>
							<button onclick="" class="layui-btn layui-btn-lg layui-btn-normal">申请欠费</button>
						</div>
		            </div>
		        	</fieldset>
				</div>
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
  	var seleDeptIdName = '';
  	
 	// 医生选择按钮
  	var doctorId = '';
  	var doctorName = '';
 	
 	// 第三步身份确认
 	var flag = false;
  	
 	var isShow = true;
 	
 	// 加载科室信息
  	function loadDiv(descr){
  		// 提示信息
 		if (isShow) {
 	  		layui.use('layer', function(){
 		  		var layer = layui.layer;
 				//12s后自动关闭
 		  		layer.msg('挂号流程如下：<br>查找科室 - 查找医生 - 信息确认 - 挂号缴费', {
 			        time: 12000, btn: ['好的']
 			    });
 			}); 
 			isShow = false;
 		}

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
  	
 	// 科室按钮
  	function cli(id,value){
  		if (seleDeptId != '') {
  			var flagDe = confirm("您已经选择部门,是否需要重新选择？" );
  			if (flagDe) {
  				location.reload();
  			}
  		} else {
  			document.getElementById("l2").style.visibility = 'visible';
  			var flag = confirm("您选择的是: " + value + " , 请您继续下一步操作" );
  	 		var div = document.getElementById(id);
  	 		// 把选择的ID赋值给全局部门ID
  	 		seleDeptId = id;
  	 		seleDeptIdName = value;
  	 		document.getElementById(seleDeptId).style.backgroundColor = 'greenyellow';
  	 		loadDoctor();
  		}
  	}
  	
 	// 加载医生信息
  	function loadDoctor(){
  		var deptid = seleDeptId.charAt(seleDeptId.length - 1);
  		$.ajax({
   			type:'POST',
   			url:'${pageContext.request.getContextPath()}/user/showDoctors.do',
   			data:{"deptid":deptid},
   			success:function(result){
   				var jsonStr = eval(result);
   				var text = '';
   		  		for (var i = 0; i < jsonStr.length; i++) {
   		  			text += '<div class="myDoc" onclick="cliDoc(this.id,'+'&quot;'+ jsonStr[i].docname +'&quot;'+')" id="'+"doc"+jsonStr[i].did+'"><div><img src="' + "../" + jsonStr[i].durl + '" width="150px" height="180px"/></div><br><div><p>'+ jsonStr[i].docname  +'</p><br><p>'+ jsonStr[i].dtitle +'</p></div></div>';
   		  		}
   			  	show2.innerHTML = text;
   			},
   		    error: function (err) {
   		    	alert("数据库异常~")
   		    }
   		}); 
  	}
  	
  	// 医生信息按钮
  	function cliDoc(id,name){
		//alert("您已选择相应科室及主治医生,请到下一步进行身份信息确认!");
		doctorId = doctorId.charAt(doctorId.length - 1);
		doctorName = name;
		$('#showdiv3').css('display','none'); 
		$('#hidediv3').css('display','block'); 
		/* layui.use('layer', function(){
	  		var layer = layui.layer;
	  		layer.msg('您已选择科室及主治医生，请进行下一步身份确认');
		}); */
		document.getElementById("l3").style.visibility = 'visible';
		layui.use('layer', function(){
	  		var layer = layui.layer;
			//8s后自动关闭
	  		layer.msg('您选择的主治医师是:  ' + name +'<br>如无误,请进行下一步身份确认', {
		        time: 8000, btn: ['好的']
		    });
		}); 
  	}
  	
  	function conInfo() {
  		document.getElementById("l4").style.visibility = 'visible';
  		flag = true;
  		layui.use('layer', function(){
	  		var layer = layui.layer;
	  		layer.msg('信息确认无误, 请继续下一步, 挂号缴费');
		});
  	}
  	
  	function conInfoFalse() {
  		location.reload();
  		window.open('${pageContext.request.getContextPath()}/user/userEdit.do');   
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
		float: left;
		margin: 10px;
		cursor: pointer;
	}
  </style>
</html>