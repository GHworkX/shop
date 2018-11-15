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

<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	function comfirmOrder(){
		
	}
</script>
</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="./网上商城/index.htm">
				<img src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif" alt="传智播客"/>
			</a>
		</div>
	</div>
	<div class="span9">
<!-- <div class="headerAd"> -->
<%-- 	<img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/> --%>
<!-- </div>	 -->
</div>
	
	<%@ include file="menu.jsp" %>
	
</div>	

<div class="container cart">

		<div class="span24">
				<table>
					<tbody>
					<tr>
						<th colspan="7">商品列表:(请联系相应的卖家或到商城营业厅取货)&nbsp;&nbsp;&nbsp;&nbsp;</th>
					</tr>
					</tbody>
				</table>
						<s:iterator var="sellerMesBean" value="sellersMes">
						<div>
						<ul>
							<li>
								<img border="2" src="${ pageContext.request.contextPath }/<s:property value="#sellerMesBean.product.image"/>"/>
							</li>
							<li>
								商品名：<s:property value="#sellerMesBean.product.pname"/></br>
								价格：<s:property value="#sellerMesBean.product.shop_price"/></br>
								卖家名称：<s:property value="#sellerMesBean.name"/></br>
								卖家电话：<s:property value="#sellerMesBean.phone"/></br>
								卖家地址：<s:property value="#sellerMesBean.addr"/></br>
								<button onclick="window.location.href='${ pageContext.request.contextPath }/order_updateState?oid=#sellerMesBean.id'">完成订单</button>
							</li>
						</ul>
						</div>
						</s:iterator>
		</div>
	</div>
</body>
</html>