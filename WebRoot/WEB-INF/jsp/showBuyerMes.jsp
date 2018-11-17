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
						<th colspan="7">有意者列表:(请联系Ta哦~)&nbsp;&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<td colspan="2">买家</td>
						<td colspan="2">买家电话</td>
						<td colspan="2">买家地址</td>
						<td>操作</td>
					</tr>
					<s:iterator var='b' value="BuyerMesBean">
					<tr>
						<td colspan="2"><s:property value="#b.name"/></td>
						<td colspan="2"><s:property value="#b.phone"/></td>
						<td colspan="2"><s:property value="#b.addr"/></td>
						<td>
							<s:if test="#b.state!=4">
								<a href="#" onclick="javascript:$('#alertBox').modal('show')">卖你了</a>
							</s:if>
						</td>
					</tr>
					</s:iterator>
					<s:if test="BuyerMesBean==null">
						<tr><th colspan="7"><font color='#00DDDD'>好像还没人看上，请耐心等待~</font></th></tr>
					</s:if>
				</tbody>
			</table>
		</div>
	</div>
	<div id="alertBox" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">确认信息</h4>
		      </div>
		      <div class="modal-body">
		    	   确定卖给<font color='red'><s:property value="#BuyerMesBean.name"/></font>?
		    	  <form id="idForm" action="${ pageContext.request.contextPath }/order_finishOrder.action" method='post'>
		    	  	<input type="hidden" name="oid" value="<s:property value="#BuyerMesBean.oid"/>"/>
		    	  	<input type="hidden" name="pid" value="<s:property value="#BuyerMesBean.pid"/>"/>
		    	  </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" onclick="javascript:$('#idForm').submit()">没错</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">点错了</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
</body>
</html>