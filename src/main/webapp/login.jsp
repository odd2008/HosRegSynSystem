<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html><head id="header"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--<base href="http://oa.whuh.com:80/">--><base href=".">
    <meta name="renderer" content="webkit"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户登录</title>
    <script src="./login_files/jquery.js.下载"></script>
    <script src="./login_files/util.js.下载"></script>
    <script src="js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="./login_files/login.css">
    <link rel="Shortcut Icon" href="http://oa.whuh.com/static/images/trasen.ico">
    <style type="text/css">
        .container{
            margin:15px auto;
            text-align:center;
            width:550px;
            position:relative;
            height:100%;
        }
        .wrapper{
            -moz-box-shadow:0px 0px 3px #aaa;
            -webkit-box-shadow:0px 0px 3px #aaa;
            box-shadow:0px 0px 3px #aaa;
            -moz-border-radius:10px;
            -webkit-border-radius:10px;
            border-radius:10px;
            border:2px solid #fff;
            background-color:#fff;
            width:550px;
            overflow:hidden;
            opacity: 0.6;
            z-index: -1;
        }
        .steps{
            width: 2200px;
            margin-left: 0px;
        }
        .step{
            float:left;
            width:550px;
            height:380px;
        }
        .loginBox div .textLineInput{
            border:none;
            float:left;
            height:30px;
            outline:none;
            border-bottom: 1px solid rgb(181, 178, 178);
            background: none;
            margin-left: initial;
        }
        .textLineInput.long{
            width: 230px;
        }
        .textLineInput.normal{
            width: 180px;
        }
        .textLineInput.short{
            width: 130px;
        }
        .timeCounter{
            margin: 5px 15px 0px 15px !important;
            display: inline-block;
            width: 104px;
            color: #fff;
            font-size: 12px;
            border: 1px solid #0697DA;
            text-align: center;
            height: 24px;
            line-height: 22px !important;
            background: #0697DA;
            cursor: pointer;
        }
        .timeCounting {
            background:#E6E6E6;
            color:#818080;
            border:1px solid #CCCCCC;
        }

        .lotis{position: relative;}
        .lotis ul{
            width: 100%;
		    float: left;
		    margin: 0 15%;
		    padding-bottom: 10px;
        }
        .loginBox{
        	padding: 20px 0 10px;
        }
        .lotis ul li{
          float:left;
          padding:0px 10px
        }
        .llq{
          float:left;
          padding:10px; 
          margin: 0 15%;
          font-size:12px
          }
        .llq a{
        	color: #4c72bc;
        	padding-left: 6px;
        }
        .llq a：hover .b_tanc{display:block;}
       .lotis ul li img{
            vertical-align: middle;
            padding-right: 5px;
    		width: 18px;
        }
        .b_tanc{position: absolute;top:-161px;display:none;z-index:999;left:15px}
        .b_tanc img{width:98%}
        .llq a:hover .b_tanc{display:block;}
		#code{  
	        font-family:Arial;  
	        font-style:italic;  
	        font-weight:bold;  
	        border:0;  
	        letter-spacing:2px;  
	        color:blue;  
	        height: 35px;
	        width: 80px;
	    }
    </style>
    <script type="application/javascript">
        var t;
        var validateSwitch=null;
        //禁用tab按钮
        document.onkeydown = function() {
            if (event.keyCode == 9) { 
                return false; 
            }
        }

        $(document).ready(function () {
        	var installHtml = "";
        	var agent = navigator.userAgent.toLowerCase();
            if (agent.indexOf("win64") >= 0 || agent.indexOf("wow64") >= 0) {
            	installHtml = '<li>支持浏览器：</li> <li><a title="点击下载" href="software/chrome64.exe"><img src="static/images/gg.png" />谷歌  </a></li>';
            	installHtml += '<li><a title="点击下载" href="software/Firefox-Setup-61.0.2x64.exe"><img src="static/images/hh.png" />火狐  </a></li>';
            	installHtml += '<li><a title="点击下载" href="software/360se9.1.0.432.exe"><img src="static/images/ie.png" />360极速模式  </a></li>';
            	$("#installUl").html(installHtml);
            }
            else {
            	installHtml = '<li>支持浏览器：</li><li><a title="点击下载" href="software/chrome32.exe"><img src="static/images/gg.png" />谷歌  </a></li>';
            	installHtml += '<li><a title="点击下载" href="software/FirefoxSetup-61.0.2-86.exe"><img src="static/images/hh.png" />火狐 </a></li>';
            	installHtml += '<li><a title="点击下载" href="software/360se9.1.0.432.exe"><img src="static/images/ie.png" />360极速模式  </a></li>';
            	$("#installUl").html(installHtml);
            }
            
			var browserType = browserTypeFun();
			
			if(browserType == 'IE6' || browserType == 'IE7' || browserType == 'IE8' || browserType == 'IE9'
				|| browserType == 'IE10'|| browserType == 'IE11' || browserType == undefined){
				alert("您的浏览器版本太低，为了能够正常使用，请升级最新的浏览器版本，如果您是360浏览器请切换到极速模式，<br>温馨提示：可以点击下方的浏览器图标进行下载！")
			}
        	
            //跳转到login界面
            $(".backLogin").click(function () {
                $('.steps').animate({marginLeft:'0px'});
            });

            //跳转到忘记密码界面
            $("a.forgotPassword").click(function () {
                $('.steps').animate({marginLeft:'-550px'});
            });
        });
        
        //jQuery实现在一个输入框按回车键后光标跳到下一个输入框  
        function focusNextInput(thisInput)  
        {   
            var loginForm = document.getElementById('loginForm');
            var inputs = loginForm.getElementsByTagName('input');
            for(var i = 0;i<inputs.length;i++){   
                // 如果是最后一个，则焦点回到第一个   
                if(i==(inputs.length-1)){  
                	login(); break;   
                }else if(thisInput == inputs[i]){   
                    inputs[i+1].focus(); break;   
                }   
            }   
        }

        /*
         * 描述：判断浏览器信息
         * 编写：LittleQiang_w
         * 日期：2016.1.5
         * 版本：V1.1
         */
        //判断当前浏览类型
        function browserTypeFun()
        {
            var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
            var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
            var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
            var isEdge = userAgent.indexOf("Windows NT 6.1; Trident/7.0;") > -1 && !isIE; //判断是否IE的Edge浏览器
            var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器
            var isSafari = userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1; //判断是否Safari浏览器
            var isChrome = userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1; //判断Chrome浏览器
     
            if (isIE) 
            {
                 var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
                 reIE.test(userAgent);
                 var fIEVersion = parseFloat(RegExp["$1"]);
                 if(fIEVersion == 7)
                 { return "IE7";}
                 else if(fIEVersion == 8)
                 { return "IE8";}
                 else if(fIEVersion == 9)
                 { return "IE9";}
                 else if(fIEVersion == 10)
                 { return "IE10";}
                 else if(fIEVersion == 11)
                 { return "IE11";}
                 else
                 { return "0"}//IE版本过低
             }//isIE end
             
             if (isFF) {  return "FF";}
             if (isOpera) {  return "Opera";}
             if (isSafari) {  return "Safari";}
             if (isChrome) { return "Chrome";}
             if (isEdge) { return "Edge";}
         }//myBrowser() end
         
         function whatBrowser(){ 
	         document.Browser.name.value=navigator.appName; 
	         document.Browser.version.value=navigator.appVersion; 
	         document.Browser.code.value=navigator.appCodeName; 
	         document.Browser.agent.value=navigator.userAgent; 
	           
	         if (window.navigator.userAgent.indexOf('compatible') != -1) {
	         	alert('360兼容模式');
	         }
	         if(window.navigator.userAgent.indexOf('AppleWebKit') != -1) {
	         	alert('360极速模式');
	         }
         }  
         
       	 function login(){
         	if ($("#pname").val()== ""||$("#password").val()== "") {	
         		alert("请填写完整信息!");
         		return;
         	}
         	var oValue = document.getElementById('input').value.toUpperCase();
    	    if(oValue ==0){
    	        alert('请输入验证码');
    	    }else if(oValue != code){
    	        alert('验证码不正确，请重新输入');
    	        oValue = ' ';
    	        createCode();
    	        return;
    	    }else{
    	        $.ajax({
    	   			type:'POST',
    	   			url:'${pageContext.request.getContextPath()}/patient/login.do',
    	   			data:$("#loginForm").serialize(),
    	   			success:function(result){
    	   				if(result == 'success'){
    	   					window.location.href = '${pageContext.request.getContextPath()}/user/index.do';
    	   				}
    	   			},
    	   		    error: function (err) {
    	   		    	alert("数据库异常~")
    	   		    }
    	   		}); 
    	    }
         }
    </script>
</head>
<body class="loginBg">
<div class="logoBox">
    <img src="./login_files/logo.png" class="logo" id="logo"><img class="logoBorder" src="./login_files/logoBorder.png"><font>自主挂号系统</font>
</div>
<div class="container">
    <div class="wrapper">
        <div class="steps">
            <div class="step login">
                <div class="loginBox">
                    <form action="" method="post" id="loginForm">
                        <div><span>账号：</span><p><img src="./login_files/userIcon.png"><input name="pname" class="textInput" type="text" placeholder="请输入您的姓名" value="" onkeypress="if(event.keyCode==13) focusNextInput(this);"></p></div>
                        <div><span>密码：</span><p><img src="./login_files/lockIcon.png"><input name="password" class="textInput" type="password" placeholder="请输入您的密码" value="" onkeypress="if(event.keyCode==13) focusNextInput(this);"></p></div>
                        <div id="validateCodeDiv"><span style="margin: 0 4px 0 20px;">验证码：</span><p style="width: 168px;"><img src="./login_files/lockIcon.png">
                        <input name="imageCodeInput" class="textInput" style="width: 135px;" type="text" id="input" placeholder="请输入右侧图中的文字" value="" onkeypress="if(event.keyCode==13) focusNextInput(this);"></p>
                        <span id="imageCode" style="width:64px"><input type = "button" id="code" onclick="createCode()"/></span></div>
                        <p class="loginAlt"></p>
                        <div class="btnBox"><button type="button" onclick="login()">登　录</button></div>
                    </form>
                    
                </div>
                 <div style="margin-top: 10px;">
                 <a style="float: right; color: #21827C;margin-right: 50px;" class="nextStep" href="register.jsp">用户注册</a>&nbsp;&nbsp;&nbsp;
					 <a style="float: right; color: #21827C;margin-right: 50px;" class="nextStep forgotPassword" href="javascript:void(0);">忘记密码?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 </div>
                 </div>
            <div class="step forgetPassword">
                <div class="loginBox">
                    <div><span>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</span><input name="userAccount" class="textLineInput long" type="text" placeholder="请输入您的账号" value="" autocomplete="off"></div>
                    <div><span>密保问题：</span><input name="mobilePhone" class="textLineInput long" type="text" placeholder="请输入答案" value="" autocomplete="off"></div>
                    <div class="btnBox"><button class="nextStep subCaptcha" type="button">提  交</button></div>
                    <div><a href="javascript:void(0);" class="backLogin">[返回login]</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(document).keydown(function(event){
		if(event.keyCode == 13){
			login();
		}
	});
});

//设置一个全局的变量，便于保存验证码
var code;
function createCode(){
    //首先默认code为空字符串
    code = '';
    //设置长度，这里看需求，我这里设置了4
    var codeLength = 4;
    var codeV = document.getElementById('code');
    //设置随机字符
    var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');
    //循环codeLength 我设置的4就是循环4次
    for(var i = 0; i < codeLength; i++){
        //设置随机数范围,这设置为0 ~ 36
         var index = Math.floor(Math.random()*36);
         //字符串拼接 将每次随机的字符 进行拼接
         code += random[index]; 
    }
    //将拼接好的字符串赋值给展示的Value
    codeV.value = code;
}

//下面就是判断是否== 的代码，无需解释
function validate(){
    var oValue = document.getElementById('input').value.toUpperCase();
    if(oValue ==0){
        alert('请输入验证码');
    }else if(oValue != code){
        alert('验证码不正确，请重新输入');
        oValue = ' ';
        createCode();
    }else{
        window.open('http://www.baidu.com','_self');
    }
}

//设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
window.onload = function (){
    createCode();
}
</script>

</html>