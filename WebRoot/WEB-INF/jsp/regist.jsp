<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/register.css"
	rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"> </script>
<!-- 引入bootstrap -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
		 integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" 
		 integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script>
	var Regexs = {  
        email: (/^[0-9a-z][0-9a-z\-\_\.]+@([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}$/i),//邮箱  
        phone: (/^0[0-9]{2,3}[2-9][0-9]{6,7}$/),//座机手机号码  
        ydphone: (/^((13[4-9])|(15[012789])|147|182|187|188)[0-9]{8}$/),//移动手机号码  
        allphone: (/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/),//所有手机号码  
        ltphone: (/^((13[0-2])|(15[56])|(186)|(145))[0-9]{8}$/),//联通手机号码  
        dxphone: (/^((133)|(153)|(180)|(189))[0-9]{8}$/),//电信手机号码  
        url: (/^http:\/\/([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}(:\d+)?\/[0-9a-z%\-_\/\.]+/i),//网址  
        num: (/[^0-9]/),//数字  
        cnum: (/[^0-9a-zA-Z_.-]/),  
        photo: (/\.png$|\.jpg$|\.jpeg$|\.gif$/i),//图片格式  
        row: (/\n/ig)  
    };  
	function checkFormIt() {
		// 校验用户名:
		// 获得用户名文本框的值:
		var username = document.getElementById("username").value;
		if (username == null || username == '') {
			alert("用户名不能为空!");
			return false;
		}
		// 校验密码:
		// 获得密码框的值:
		var password = document.getElementById("password").value;
		if (password == null || password == '') {
			alert("密码不能为空!");
			return false;
		}
		// 校验确认密码:
		var repassword = document.getElementById("repassword").value;
		if (repassword != password) {
			alert("两次密码输入不一致!");
			return false;
		}
		
		// 校验学号:
		// 获得学号框的值:
		var code = document.getElementById("code").value;
		if (code.length!=11) {
			alert("学号错误!");
			return false;
		}
		
		//校验图片
		var filename = $("#ykt").val();
		if(filename.length<1 || !Regexs['photo'].test(filename) ){
			alert("请选择图片上传!");
			return false;
		}
		
		var phone = $("#phone").val();
		if(phone.length<1 || !Regexs['allphone'].test(phone)){
			alert("请填写正确的电话!");
			return false;
		}
	}

	function checkUsername() {
		// 获得文件框值:
		var username = document.getElementById("username").value;
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					document.getElementById("span1").innerHTML = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET",
				"${pageContext.request.contextPath}/user_findByName.action?time="
						+ new Date().getTime() + "&username=" + username, true);
		// 4.发送
		xhr.send(null);
	}

	function createXmlHttp() {
		var xmlHttp;
		try { // Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {// Internet Explorer
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}

		return xmlHttp;
	}

	function changeImg() {
		var img1 = document.getElementById("checkImg");
		img1.src = "${pageContext.request.contextPath}/checkImg.action?time"
				+ new Date().getTime();
	}
</script>
</head>
<body>

	<%@ include file="menu.jsp"%>
		
	<div class="container register" style="padding-top:80px;padding-buttom:50px;">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>会员注册</strong>USER REGISTER
					</div>
					<div>
						<s:actionerror />
					</div>
					<form id="registerForm"
						action="${ pageContext.request.contextPath }/user_regist.action"
						method="post" enctype="multipart/form-data" novalidate="novalidate"
						onsubmit="return checkFormIt();">
						<table>
							<tbody>
								<tr>
									<th><span class="requiredField">*</span>用户名:</th>
									<td><input type="text" id="username" name="username"
										class="text" maxlength="20" onblur="checkUsername()" /> <span
										id="span1"></span></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>密&nbsp;&nbsp;码:</th>
									<td><input type="password" id="password" name="password"
										class="text" maxlength="20" autocomplete="off" /> <span><s:fielderror
												fieldName="password" /></span></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>确认密码:</th>
									<td><input id="repassword" type="password"
										name="repassword" class="text" maxlength="20"
										autocomplete="off" /></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>E-mail:</th>
									<td><input type="text" id="email" name="email"
										class="text" maxlength="200"> <span><s:fielderror
													fieldName="email" /></span></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>姓名:</th>
									<td><input type="text" name="name" class="text"
										maxlength="200" /> <span><s:fielderror fieldName="name" /></span>
									</td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>学号:</th>
									<td><input id="code" type="text" name="code" class="number"
										onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="只能输入11位的数字" /> <span><s:fielderror fieldName="code" /></span>
									</td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>一卡通照片:</th>
									<td><input id="ykt" type="file" class="file-loading" name="upload" /></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>电话:</th>
									<td><input type="text" id="phone" name="phone" class="text" /></td>
								</tr>

								<tr>
									<th><span class="requiredField">*</span>地址:</th>
									<td><input type="text" name="addr" class="text"
										maxlength="200" /> <span><s:fielderror fieldName="addr" /></span>
									</td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>验证码:</th>
									<td><span class="fieldSet"> <input type="text"
											id="checkcode" name="checkcode" class="text captcha"
											maxlength="4" autocomplete="off"><img id="checkImg"
												class="captchaImage"
												src="${pageContext.request.contextPath}/checkImg.action"
												onclick="changeImg()" title="点击更换验证码"></span></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="同意以下协议并注册"></td>
								</tr>
							</tbody>
						</table>
						<div class="login">
							<div class="ad">
								<dl>
									<dt>注册即享受</dt>
									<dd>正品保障、正规发票</dd>
									<dd>货到付款、会员服务</dd>
									<dd>自由退换、售后上门</dd>
								</dl>
							</div>
							<dl>
								<dt>已经拥有账号了？</dt>
								<dd>
									立即登录即可体验在线购物！ <a
										href="${pageContext.request.contextPath}/user_loginPage.action">立即登录</a>
								</dd>
							</dl>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>