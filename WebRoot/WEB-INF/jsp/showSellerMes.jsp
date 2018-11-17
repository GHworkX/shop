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
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"> </script>
<!-- 引入bootstrap -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
		 integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" 
		 integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
	
	<%@ include file="menu.jsp" %>

<div class="container cart" style="padding-top:80px;padding-buttom:50px">

		<div class="span24">
				<table class="table table-striped">
					<tbody>
					<tr>
						<th colspan="7">商品列表:(请联系相应的卖家或到商城营业厅取货)&nbsp;&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr>
					<td>
						<div  class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<s:iterator var="sellerMesBean" value="sellersMes">
									<img src="${pageContext.request.contextPath }/<s:property value="#sellerMesBean.product.image"/>">
									</s:iterator>
								</div>
							</div>

							<!-- Controls -->
							<a class="left carousel-control" href="#carousel-example-generic"
								role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						商品名：<s:property value="#sellerMesBean.product.pname"/></br>
								价格：<s:property value="#sellerMesBean.product.shop_price"/></br>
								商品介绍：<s:property value="#sellerMesBean.product.pdesc"/></br>
								卖家名称：<s:property value="#sellerMesBean.name"/></br>
								卖家电话：<s:property value="#sellerMesBean.phone"/></br>
								卖家地址：<s:property value="#sellerMesBean.addr"/></br>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>