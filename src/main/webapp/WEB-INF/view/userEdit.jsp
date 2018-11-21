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
  	<link rel="Shortcut Icon" href="http://oa.whuh.com/static/images/trasen.ico">
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form">
          
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>手机
              </label>
              <div class="layui-input-inline">
                  <input type="tel" value="${user.ptel}" id="phone" name="ptel" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的联系方式
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>新密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="password" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repassword" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  修改
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
          //自定义验证规则
          form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
        	  $.ajax({
  	   			type:'POST',
  	   			url:'${pageContext.request.getContextPath()}/user/update.do',
  	   			data:{"ptel":$('#phone').val(),"password":$('#L_pass').val()},
  	   			success:function(result){
  	   			layui.use('layer', function(){
		  	  	  	var layer = layui.layer;
		  	  			//5s后自动关闭
		  	  	  		layer.msg('   信息修改成功~  ', {
		  	  		        time: 10000, btn: ['好的']
		  	  		    });
		  	  		}); 
  	   				$('#L_pass').val('');
  	   				$('#L_repass').val('');
  	   			},
  	   		    error: function (err) {
  	   		    	alert("数据库异常~")
  	   		    }
  	   		}); 
            return false;
          });
        });
    </script>
  </body>

</html>