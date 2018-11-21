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
    <div class="x-body layui-anim layui-anim-up">
        <fieldset class="layui-elem-field">
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
        </fieldset>
    </div>
        
  </body>

</html>