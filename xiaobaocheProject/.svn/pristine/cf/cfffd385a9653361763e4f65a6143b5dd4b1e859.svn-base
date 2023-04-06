<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>象网汽配平台-亿象网络科技</title>
		<link rel="stylesheet" type="text/css" href="/program/admin/css/button.css"/>
		<style>
			body {background: #E5E5E5;font-family: "微软雅黑" ,"microsoft yahei" ,arial, helvetica, sans-serif;}
			.login-banner{width: 1000px; line-height: 100px; height: 100px; background: #E9E9E9;margin: 50px auto; color: #C40000;text-align: center;position:relative; }
			.login-container {width: 900px;height: 300px;margin: auto;position: relative;}
			.welcome {width: 180px; height: 90px; background: #BFBFBD;color: #676661; font-size: 20px;float: left; position: absolute; top:20px ;left: 60px;;}
			.form-container { width: 600px; height: 300px; background: url("/program/admin/imgs/admin-login-back.png") ;margin-right: 20px; float: right;} 
			.form-container form{ font-size: 18px;margin: 75px 0 0 75px;} 
			.control-group {margin-bottom: 10px ;}
			.control-group font{normal 12px/1.6 arial,'Hiragino Sans GB',\5b8b\4f53,sans-serif;}
			.control-label { width:120px ; float: left; text-align: right;height: 22px; line-height: 22px;}
			.controls {margin-left: 120px;}
			.controls input {height: 22px;line-height: 22px;}
			.controls p {vertical-align: middle;}
			.help-block{margin: 9px 0 0 0 ;}
		</style>
	</head>
	<body>
		<div class="login-banner" >
			<div style="position: absolute;top:20px ;left: 250px;">
        		<img width="50" height="50" src="/program/admin/imgs/logo.jpg"/>
       		 </div> 
			<h1 style="padding-left:80px;">亿象网络微信公众号后台登陆系统</h1>
		</div>
		
		<div class="login-container ">
			<div class="welcome">
				<div style="font-size:50px ;color: #50514F; position: absolute;top: 10px; left: 25px;">U</div>
				<div style="position: absolute; top: 15px; left:65px ;">
					<span>欢迎登陆</span><br />
					<span>serlogin</span>
				</div>
			</div>
			<div class="form-container">
				<form id="loginForm" action="/runtime/services/service_admin_login" method="post">
					<div class="control-group">
						<label class="control-label">用户名：</label>
						<div class="controls">
							<input type="" name="user_name" id="" value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">密&nbsp;&nbsp;&nbsp;码：</label>
						<div class="controls">
							<input type="password" name="password" id="" value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">验证码：</label>
						<div class="controls">
							<input type="text" id="validatCode" style="width:100px;"/>
            				<input type = "button" id="code" onclick="createCode()"/> 
						</div>
					</div>
					<div class="control-group" style="padding:20px 0 0 90px ;">
						<a  id="loginBtn" class="btn btn-primary" style="width: 56px;"/>登录</a>
						<a  class="btn btn-danger" >忘记密码</a>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
    	var code ; //在全局定义验证码   
		//产生验证码  
		window.onload = init
		
		
		function init(){
			createCode()
			document.getElementById("loginBtn").onclick = login
		}

		function login(){
			if(validate()){
				alert("right")
			}	
		}

		function createCode(){  
		     code = "";   
		     var codeLength = 4;//验证码的长度  
		     var checkCode = document.getElementById("code");   
		     var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
		     'S','T','U','V','W','X','Y','Z');//随机数  
		     for(var i = 0; i < codeLength; i++) {//循环操作  
		        var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）  
		        code += random[index];//根据索引取得随机数加到code上  
		    }  
		    checkCode.value = code;//把code值赋给验证码  
		}  
		//校验验证码  
		function validate(){  
		    var inputCode = document.getElementById("validatCode").value.toUpperCase(); //取得输入的验证码并转化为大写        
		    if(inputCode.length <= 0) { //若输入的验证码长度为0  
		        alert("请输入验证码！")
				return false
		    }         
		    else if(inputCode != code ) { //若输入的验证码与产生的验证码不一致时  
		        alert("验证码输入错误"); //则弹出验证码输入错误  
		        createCode();//刷新验证码  
		        document.getElementById("input").value = "";//清空文本框  
				return false
		    } 
			document.getElementById("loginForm").submit()   
		}  
    </script>
</html>
