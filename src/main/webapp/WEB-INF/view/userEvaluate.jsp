<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>协和医院欢迎您</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<link rel="Shortcut Icon"
	href="http://oa.whuh.com/static/images/trasen.ico">
</head>

<body>
	<div class="x-body layui-anim layui-anim-up">
		<fieldset class="layui-elem-field">
			<legend>评价医师</legend>
			<div style="padding: 20px">
				<textarea id="evaluate" name="" maxlength="999" required lay-verify="required"
					placeholder="请输入" class="layui-textarea"></textarea>
			</div>
			<button style="margin-left: 20px;" onclick="addEvaluate()"
				class="layui-btn">确认</button>
		</fieldset>
	</div>
</body>
<script type="text/javascript">
	function addEvaluate(){
		$.ajax({
  			type:'POST',
  			url:'${pageContext.request.getContextPath()}/patient/addEvaluate.do',
  			data:{"rid":'${rid}',"evaluate":$('#evaluate').val()},
  			success:function(result){
	  			layui.use('layer', function(){
	 	  	  	var layer = layui.layer;
	 	  	  		layer.msg('   感谢您的评价~  ', {
	 	  		        time: 1000, btn: ['好的']
	 	  		    });
	 	  		}); 
	  			setTimeout('closeThis()', 1800)
  			},
  		    error: function (err) {
  		    	alert("数据库异常~")
  		    }
  		}); 
	  }
	
	 function closeThis(){
		 var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	     parent.layer.close(index);
	 }
	
</script>

</html>