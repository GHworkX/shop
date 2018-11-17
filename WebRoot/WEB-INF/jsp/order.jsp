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

<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	

function cOrder() {
		var add = $('#addr').val();
		var name = $('#name').val();
		var phone = $('#phone').val();
		if (add != null && add != "" &&  name != null && name != "" && phone != null && phone != "")
			document.getElementById('orderForm').submit();
		else{
			$('#alertBox').modal('show');
			return false;			
		}
	}
</script>
</head>
<body>

	<%@ include file="menu.jsp"%>

	<div class="container cart"
		style="padding-top: 80px; padding-buttom: 50px">

		<div class="span24">

			<table>
				<tbody>
					<tr>
						<th>图片</th>
						<th>商品名</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					<tr>
						<td width="60"><img
							src="${ pageContext.request.contextPath }/<s:property value="buyProduct.image"/>" />
						</td>
						<td><s:property value="buyProduct.pname" /></td>
						<td><s:property value="buyProduct.shop_price" /></td>
						<td class="quantity" width="60">1</td>
						<td width="140"><span class="subtotal">￥<s:property
									value="buyProduct.shop_price" /></span></td>

					</tr>
					<tr>
						<td colspan="5">
							<dl id="giftItems" class="hidden" style="display: none;">
							</dl>
							<div class="total">
								<em id="promotion"></em> 商品金额: <strong id="effectivePrice">￥<s:property
										value="buyProduct.shop_price" />元
								</strong>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<form class="form-horizontal" id="orderForm"
								action="${ pageContext.request.contextPath }/order_payOrder.action"
								method="post">
								<input type="hidden" name="pid"
									value="<s:property value="buyProduct.pid"/>" />
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">
										<span class="requiredField">*</span>收货地址：
									</label>
									<div class="col-sm-10">
										<input id="addr" name="addr" type="text"
											value="<s:property value="#session.existUser.addr"/>"
											class="form-control" style="width: 350px" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">
										<span class="requiredField">*</span>收货人&nbsp;&nbsp;&nbsp;：
									</label>
									<div class="col-sm-10">
										<input id="name" name="name" type="text"
											value="<s:property value="#session.existUser.name"/>"
											class="form-control" style="width: 150px" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">
										<span class="requiredField">*</span>联系方式：
									</label>
									<div class="col-sm-10">
										<div class="checkbox">
											<input id="phone" name="phone" type="text"
												value="<s:property value="#session.existUser.phone"/>"
												class="form-control" style="width: 150px" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-default" onclick="return cOrder()">提交订单</button>
									</div>
								</div>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="alertBox" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">错误信息</h4>
		      </div>
		      <div class="modal-body">
		    	   亲，您的信息没填写完整哦~
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</div>
</body>
</html>