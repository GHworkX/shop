<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>西电二手交易平台</title>
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"> </script>
<!-- 引入bootstrap -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
		 integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" 
		 integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" />
<style>
</style>

</head>
<body>

	<%@ include file="menu.jsp" %>

	<div class="container login" style="padding-top:100px;">
		<div class="span11 last">
			<div class="ad">
				<img src="${pageContext.request.contextPath}/image/login.jpg"
					width="500" height="330" alt="会员登录" title="会员登录">
			</div>
		</div>
		<div class="span11 last">
			<div class="wrap" style="margin-top:25px">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN

					</div>
					<div>
						<s:actionerror />
					</div>
					<form id="loginForm"
						action="${ pageContext.request.contextPath }/user_login.action"
						method="post" novalidate="novalidate">
						<table>
							<tbody>
								<tr>
									<th>用户名:</th>
									<td><input type="text" id="username" name="username"
										class="text" maxlength="20"></td>
								</tr>
								<tr>
									<th>密&nbsp;&nbsp;码:</th>
									<td><input type="password" id="password" name="password"
										class="text" maxlength="20" autocomplete="off"></td>
								</tr>


								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="登 录"></td>
								</tr>
								<tr class="register">
									<th>&nbsp;</th>
									<td>
										<dl>
											<dt>还没有注册账号？</dt>
											<dd>
												立即注册即可体验在线购物！ <a
													href="${ pageContext.request.contextPath }/user_registPage.action">立即注册</a>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>