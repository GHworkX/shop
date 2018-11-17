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
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"> </script>
<!-- 引入bootstrap -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
		 integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" 
		 integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<style>
			html,body{
				height: 100%;
				width:100%;
			}
		</style>
	</head>
<body
<%--  style="background-image: url(../${pageContext.request.contextPath}/images/bg.jpg);background-size: 100% 100%; --%>
<%--     background-repeat: no-repeat;" --%>
    >
	<%@ include file="menu.jsp" %>

<div class="container" style="padding-top:80px;padding-buttom:50px;">
	<ul class="nav nav-tabs">
	  <li role="presentation" class="active"><a href="#">最新商品</a></li>
	</ul>
			<div class="row" style="padding-top:20px">
				<s:iterator var="p" value="hList">
				  <div class="col-xs-6 col-md-3">
				    <a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" class="thumbnail" target="_blank">
				      <img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" alt="<s:property value="#p.pname"/>">
				      <s:property value="#p.pname"/></br>
				      	上架时间:<s:date name="#p.pdate" format="yyyy-MM-dd hh:mm"/></br>
				      <s:if test="#p.pdesc.length()>10">
				      	简介：<s:property value="#p.pdesc.substring(0, 10)"/>......
				      </s:if>
				      <s:elseif test="#p.pdesc.length()>0">
				      	简介：<s:property value="#p.pdesc"/>......
				      </s:elseif>
				    </a>
				  </div>
				</s:iterator>		
			</div>
</div>
<div></div>
</body>
</html>