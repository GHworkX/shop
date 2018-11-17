<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<script>
	function submitIt(){
		$("#userAction_save_do").submit();
	}
	function addDetailCategorySecond(){
		var cid = $('#bigC').val();
		if(cid!=-1){
			$.ajax({
		          method:"post",
		          url: '/shop/json/category',
		          dataType : "json",
		          data:{'cid':cid},
		          async:true,
		          success:function (result) {
					$("#smallC").html("<option value='-1'></option>");
					$.each(result.list, function (index, obj) {
						 var htmlS = "<option value="+obj.id+">"+obj.name+"</option>";
			        	  $("#smallC").append(htmlS);
					});
		          }
			})
		}
		
	}
</script>

	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="/shop/index">XDPlatpform</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/shop/index">首页</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">商品分类<span class="caret"></span></a>
              <ul class="dropdown-menu">
	              <s:iterator var="c" value="#session.cList">
				  	<li><a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a></li>
			      </s:iterator>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
           <s:if test="#session.existUser == null">
			<li id="headerLogin">
				<a href="${ pageContext.request.contextPath }/user_loginPage.action">登录</a></li>
			<li id="headerRegister"><a href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>
			</li>
			</s:if>
			<s:else>
			<li id="headerLogin">
				<a href="${ pageContext.request.contextPath }/order_findByUid.action?page=1"><s:property value="#session.existUser.name"/></a>
				</li>
			<li id="headerLogin">
				<a href="${ pageContext.request.contextPath }/order_findByUid.action?page=1">我的订单</a>
			</li>
			<li id="headerLogin"  class="dropdown" >
				<a href="#"  class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的商品<span class="caret"></span></a>
				 <ul class="dropdown-menu">
					 <li><a href="${ pageContext.request.contextPath }/product_findByUid.action?page=1">商品列表</a></li>
					 <li><a href="#" data-toggle="modal" data-target="#myModal">上传商品</a></li>
             	 </ul>
			</li>
			<li id="headerRegister"><a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>
			</li>
			</s:else>
			
			<li><a>会员中心</a></li>
			<li><a>购物指南</a></li>
<%--             <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li> --%>
          </ul>
        </div>
      </div>
    </nav>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加我的商品</h4>
      </div>
      <div class="modal-body">
        		<form  class="form-inline" id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/product_save.action" method="post" enctype="multipart/form-data">
			<table class="table table-hover" cellSpacing="1" cellPadding="6" width="100%" align="center">
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称：
					</td>
					<td class="ta_01" bgColor="#ffffff"  colspan="3">
						<input type="text" name="pname" value="" id="userAction_save_do_logonName" class="form-control"/>
					</td>
<!-- 					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01"> -->
<!-- 						是否热门： -->
<!-- 					</td> -->
					<td class="ta_01" bgColor="#ffffff" style="display:none">
						<select name="is_hot">
							<option value="1" selected = "selected">是</option>
							<option value="0">否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						所属大类：
					</td>
					<td  class="ta_01" bgColor="#ffffff">
						<select id="bigC" class="form-control" name="category" onchange="addDetailCategorySecond()">
							<option value="-1"></option>
							<s:iterator var="c" value="#session.cList">
							  	<option value="<s:property value="#c.cid"/>"><s:property value="#c.cname"/></option>
						      </s:iterator>
						</select>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						所属细类：
					</td>
					<td  class="ta_01" bgColor="#ffffff">
						<select id="smallC" class="form-control" name="categorySecond.csid">
							<option value="-1"></option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						市场价格：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="market_price" value="" id="userAction_save_do_logonName" class="form-control"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						您的定价：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="shop_price" value="" id="userAction_save_do_logonName" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input class="file"  type="file" name="upload" />
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea  class="form-control" style="width:100%" name="pdesc" rows="6" cols="30"></textarea>
					</td>
				</tr>
			</table>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submitIt()">上传我的宝贝</button>
<!--         <button type="reset" class="btn btn-default" onclick="">重置</button> -->
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
      </div>
    </div>
  </div>
</div>