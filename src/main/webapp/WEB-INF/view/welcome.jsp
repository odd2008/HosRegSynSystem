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
    </head>
    <body onload="setTime()">
    <div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">欢迎用户：
            <span class="x-red">${user.pname}</span>！当前时间:<span id="time"></span></blockquote>
        <fieldset class="layui-elem-field">
            <legend>自助挂号系统使用须知:</legend>
            <div class="layui-field-box">
                <table class="layui-table" lay-skin="line">
                    <tbody>
                        <tr><td >
                        <p>1、预约实名制：请提供就诊患者真实姓名、身份证号（身份证、军官证、护照）、患者本人手机号等信息。</p>
                        </td></tr>
                        <tr><td >
                        <p>2、电话及网络预约为武汉市统一预约挂号平台预约</p>
                        </td></tr>
                        <tr><td >
                        <p>3、自助机预约：须持银联卡（信用卡、储蓄卡均可），医保卡（医保患者）</p>
                        </td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>操作指引</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>个人信息</th>
                            <td>支持个人信息查询修改，病史查询，密码修改等</td></tr>
                        <tr>
                            <th>挂号信息</th>
                            <td>支持挂号信息的查询</td></tr>
                        <tr>
                            <th>我要挂号</th>
                            <td>请按照指引,完成挂号和缴费工作</td></tr>
                        <tr>
                            <th>相关介绍</th>
                            <td>医院及医保政策的相关介绍</td></tr>
                        <tr>
                            <th>医疗贴士</th>
                            <td>告诉您如何正确预防疾病和处理紧急情况</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>开发团队</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>版权所有</th>
                            <td>${admin.owner}</td>
                        </tr>
                        <tr>
                            <th>开发者</th>
                            <td>${admin.oauth}</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
    </div>
        <script>
        	function setTime(){
        		var timer = setInterval('onTime()',1000);
        	}
        	function onTime(){
        		var date = new Date();
			    var seperator1 = "-";
			    var seperator2 = ":";
			    var month = date.getMonth() + 1;
			    var strDate = date.getDate();
			    if (month >= 1 && month <= 9) {
			        month = "0" + month;
			    }
			    if (strDate >= 0 && strDate <= 9) {
			        strDate = "0" + strDate;
			    }
			    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
			            + " " + date.getHours() + seperator2 + date.getMinutes()
			            + seperator2 + date.getSeconds();
			    var time = document.getElementById("time");
			    time.innerHTML = currentdate;
        	}
        </script>
    </body>
</html>