<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>我的商品</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript">
			function addProduct(){
				window.location.href = "${pageContext.request.contextPath}/product_addPage.action";
			}
</script>
</head>
<body>

	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="./网上商城/index.htm"> <img
					src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif"
					alt="传智播客" /> </a>
			</div>
		</div>

		<%@ include file="menu.jsp"%>

	</div>

	<div class="container cart">

		<div class="span24">

			<div class="step step1">
				<ul>

					<li></li>
					<li>我的订单</li>
				</ul>
				<ul sytle="float:right">
					<li></li>
					<li><button type="button" id="add" name="add" style="width:150px;height:20px;" onclick="addProduct()">上传我的商品</button></li>
				</ul>
			</div>

			<table>
				<tbody>
					<s:iterator var="product" value="pageBean.list">
						<tr>
							<th colspan="5">
							上传日期:<s:date name="#product.pdate" format="yyyy-MM-dd hh:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;商品金额:<font
								color="red"><s:property value="#product.shop_price" />
							</font>
							&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">
								<s:if test="#product.state == 1">
									未售出
								</s:if>
								<s:if test="#order.state == 2">
									已售出
								</s:if>
							</font>
							</th>
						</tr>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>操作</th>
						</tr>
							<tr>
								<td width="60"><img
									src="${ pageContext.request.contextPath }/<s:property value="#product.image"/>" />
								</td>
								<td><s:property value="#product.pname" /></td>
								<td><s:property value="#product.shop_price" /></td>
								<td width="140">
										<a href="">删除</a>
								</td>
							</tr>
					</s:iterator>
					<tr>
						<th colspan="5">
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