<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">XDPlatpform</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">首页</a></li>
<!--             <li><a href="#contact">Contact</a></li> -->
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
			<li id="headerLogin" >
				<a href="${ pageContext.request.contextPath }/product_findByUid.action?page=1">我的商品</a>
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
