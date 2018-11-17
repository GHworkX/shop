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

<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />
<script>
	$(function() {
		$('#introduct').popover({
			html : true
		}).popover('show');
		$('#introduct').focus();
	})
	function confirmOrder(){
		document.getElementById("cartForm").submit();
	}
</script>
<style>
.wordC {
	word-wrap: break-word;
}
</style>
</head>
<body>

	<%@ include file="menu.jsp"%>

	<div class="container productContent"
		style="padding-top: 80px; padding-buttom: 50px;">
		<table class="table table-striped">
			<tbody>
				<tr><th>商品名：<s:property value="model.pname" /></th></tr>
				<tr>
					<td>
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
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
									<img
										src="${pageContext.request.contextPath }/<s:property value="model.image"/>">
									<!-- 						      <div class="carousel-caption"> -->
									<!-- 						      </div> -->
								</div>
								<!-- 						    <div class="item"> -->
								<!-- 						      <img src="..." alt="..."> -->
								<!-- 						      <div class="carousel-caption"> -->
								<!-- 						        ... -->
								<!-- 						      </div> -->
								<!-- 						    </div> -->
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
						<div class="info">
							<dl>
								<dt>一口价:</dt>
								<dd>
									<strong>￥：<s:property value="model.shop_price" />元
									</strong> 参 考 价：
									<del>
										￥
										<s:property value="model.market_price" />
										元
									</del>
								</dd>
							</dl>
						</div>
						<button type="button" id="introduct" class="btn btn-info"
							data-toggle="popover" title="卖家评语" data-trigger="focus"
							data-content='
						<p class="wordC"><s:property value="model.pdesc"/></p>
					'>商品介绍</button>
					</td>
				</tr>
				<tr>
					<td>
						<form id="cartForm"
							action="${ pageContext.request.contextPath }/order_confirmOrder.action"
							method="post">
							<input type="hidden" name="pid"
								value="<s:property value="model.pid"/>" />
								<div class="buy" style="float:right">
									<input class="addCart" value="我要带走" type="button"
										onclick="confirmOrder()" />
								</div>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>