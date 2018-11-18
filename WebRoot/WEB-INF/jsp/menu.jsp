<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<style>
	.extPic{
		display:none;
	}
</style>
<script>
var Regexs = {  
        email: (/^[0-9a-z][0-9a-z\-\_\.]+@([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}$/i),//邮箱  
        phone: (/^0[0-9]{2,3}[2-9][0-9]{6,7}$/),//座机手机号码  
        ydphone: (/^((13[4-9])|(15[012789])|147|182|187|188)[0-9]{8}$/),//移动手机号码  
        allphone: (/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/),//所有手机号码  
        ltphone: (/^((13[0-2])|(15[56])|(186)|(145))[0-9]{8}$/),//联通手机号码  
        dxphone: (/^((133)|(153)|(180)|(189))[0-9]{8}$/),//电信手机号码  
        url: (/^http:\/\/([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}(:\d+)?\/[0-9a-z%\-_\/\.]+/i),//网址  
        num: (/[^0-9]/),//数字  
        cnum: (/[^0-9a-zA-Z_.-]/),  
        photo: (/\.png$|\.jpg$|\.jpeg$|\.gif$/i),//图片格式  
        row: (/\n/ig)  
    }; 
	function submitIt(){
		var maxSize = 20*1024*1024;
		var sum =0;
		var current = true;
		$('.file').each(function (i){
			var file = this.files[0];
			if(file!=undefined){
				sum +=file.size;
				if(!Regexs['photo'].test(file.name)){
					current = false;
				}
			}
		});
		if($("#upload")[0].files[0]==undefined){
			current = false;
		}
		if($("#pname").val()==null || $("#pname").val()==""){
			current = false;
		}
		if($("#smallC").val()==null || $("#smallC").val()==""){
			current = false;
		}
		if($("#market_price").val()==null || $("#market_price").val()==""){
			current = false;
		}
		if($("#shop_price").val()==null || $("#shop_price").val()==""){
			current = false;
		}
		if(!current){
			alert("商品名、图片、价格、分类不能为空或上传图片格式不正确");
		}else if(sum>=20971520)
			alert("总上传图片大小不能超过20M~");
		else
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
			<li><a href="${ pageContext.request.contextPath }/user_shopGuidePage.action">购物指南</a></li>
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
						<input type="text" id="pname" name="pname" value="" class="form-control"/>
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
						<input type="text" id="market_price" name="market_price" value="" class="form-control"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						您的定价：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" id="shop_price" name="shop_price" value="" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input class="file" id="upload"  type="file" name="upload"/>
					</td>
					<td id="addTdBox"><a href="#" onclick="javascript:$('.extPic').show();$('#addTdBox').hide()">添加更多？</a></td>
				</tr>
					<tr class="extPic">
						<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
							附件1：
						</td>
						<td class="ta_01" bgColor="#ffffff" colspan="3">
							<input class="file"  type="file" name="upload1"/>
						</td>
						<td><a href="#" onclick="javascript:$('#addTdBox').show();$('.extPic').hide()">我不想添加</a></td>
					</tr>
					<tr class="extPic">
						<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
							附件2：
						</td>
						<td class="ta_01" bgColor="#ffffff" colspan="3">
							<input class="file"  type="file" name="upload2"/>
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