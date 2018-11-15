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

<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />
<script>
	function checkOrderShop(){
		var url="${ pageContext.request.contextPath }/order_showSellerMes.action?oid=";
		var oid = document.getElementById('oid').innerHTML;
		window.location.href=url+oid;
		return false;
	}
</script>
</head>
<body>
		<%@ include file="menu.jsp"%>

	<div class="container cart">

		<div class="span24">

			<div class="step step1">
				<ul>
					<li class="current"></li>
					<li>我的订单</li>
				</ul>
			</div>


			<table>
				<tbody>
					<s:iterator var="order" value="pageBean.list">
						<tr>
							<th colspan="6">订单编号:<font id="oid"><s:property value="#order.oid" /></font>&nbsp;&nbsp;&nbsp;&nbsp;
							订单日期:<s:date name="#order.ordertime" format="yyyy-MM-dd hh:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;订单金额:<font
								color="red"><s:property value="#order.total" />
							</font>
							&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">
								<s:if test="#order.state == 1">
									<a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid" />">付款</a>
								</s:if>
								<s:if test="#order.state == 2">
									已付款
								</s:if>
								<s:if test="#order.state == 3">
									<a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid" />">确认收货</a>
								</s:if>
								<s:if test="#order.state == 4">
									交易成功
								</s:if>
							</font>
							</th>
						</tr>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
						<s:iterator var="orderItem" value="#order.orderItems">
							<tr>
								<td width="60"><img
									src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>" />
								</td>
								<td><s:property value="#orderItem.product.pname" /></td>
								<td><s:property value="#orderItem.product.shop_price" /></td>
								<td class="quantity" width="60"><s:property
										value="#orderItem.count" /></td>
								<td width="140"><span class="subtotal">￥<s:property
											value="#orderItem.subtotal" />
								</span></td>
								<td width="60">
									<a href="#" onclick="checkOrderShop()">查看订单商品信息</a>
								</td>
							</tr>
						</s:iterator>
					</s:iterator>
					<tr>
						<th colspan="6">
						<div class="pagination">
							<span>第<s:property value="pageBean.page" />/<s:property
								value="pageBean.totalPage" />页 </span>
								<s:if test="pageBean.page != 1">
								<a
									href="${ pageContext.request.contextPath }/order_findByUid.action?page=1"
									class="firstPage">&nbsp;</a>
								<a
									href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page-1"/>"
									class="previousPage">&nbsp;</a>
							</s:if> <s:iterator var="i" begin="1" end="pageBean.totalPage">
								<s:if test="pageBean.page != #i">
									<a
										href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#i"/>"><s:property
											value="#i" />
									</a>
								</s:if>
								<s:else>
									<span class="currentPage"><s:property value="#i" />
									</span>
								</s:else>
							</s:iterator> <s:if test="pageBean.page != pageBean.totalPage">
								<a class="nextPage"
									href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
								<a class="lastPage"
									href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
							</s:if>
							</div>
							</th>
					</tr>
				</tbody>
			</table>


		</div>

	</div>
<!-- 	<div class="container footer"> -->
<!-- 		<div class="span24"> -->
<!-- 			<div class="footerAd"> -->
<!-- 				<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" -->
<!-- 					title="我们的优势" height="52" width="950"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="span24"> -->
<!-- 			<ul class="bottomNav"> -->
<!-- 				<li><a href="#">关于我们</a> |</li> -->
<!-- 				<li><a href="#">联系我们</a> |</li> -->
<!-- 				<li><a href="#">诚聘英才</a> |</li> -->
<!-- 				<li><a href="#">法律声明</a> |</li> -->
<!-- 				<li><a>友情链接</a> |</li> -->
<!-- 				<li><a target="_blank">支付方式</a> |</li> -->
<!-- 				<li><a target="_blank">配送方式</a> |</li> -->
<!-- 				<li><a>SHOP++官网</a> |</li> -->
<!-- 				<li><a>SHOP++论坛</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 		<div class="span24"> -->
<!-- 			<div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>