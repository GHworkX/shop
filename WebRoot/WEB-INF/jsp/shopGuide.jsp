<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>西电二手交易平台</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/register.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js">
	
</script>
<!-- 引入bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style>
html, body {
	height: 100%;
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="container" style="padding-top: 80px; padding-buttom: 50px;">
		<h2 style="color:#dda0dd">注：本平台目前暂不支持在线支付，买卖双方在确认订单后请积极联系，线下交易</h2>
		<dl>
			<dt>购物流程</dt>
			<dd>1.在商品浏览页查看所有商品</dd>
			<dd>2.提交订单（填写正确的电话和地址）</dd>
			<dd>3.联系卖家（线下交易）</dd>
		</dl>
		<dl>
			<dt>用户须知</dt>
			<dd>用户注册时提供一卡通图片，验证是否西电学生</dd>
			<dd>用户需提供正确的电话和地址</dd>
			<dd>用户既可以购物也可提供商品</dd>
			<dd>所有商品由西电学生或本商城提供</dd>
		</dl>
		<dl>
			<dt>买家须知</dt>
			<dd>提交订单时要填写正确的电话和地址</dd>
			<dd>提交订单后请积极联系卖家验货交易</dd>
		</dl>
		<dl>
			<dt>卖家须知</dt>
			<dd>上传商品信息请描述清楚商品</dd>
			<dd>商品图片共可上传3张</dd>
			<dd>您可在"我的商品"中查看对该商品感兴趣的买家</dd>
			<dd>查看订单后请积极联系买家验货交易</dd>
		</dl>
	</div>
</body>
</html>