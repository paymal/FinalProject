<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Backstage - 健康花城</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
<script type="text/javascript">
  function jump2(p){
	  location.href='productSelect?cp='+p;
  }
  </script>
</head>
<body style="background: pink">
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.png" /></div>
	<div class="help"><a href="../indexSelect">Return to the front page</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">Mainpage</a></li>
			<li><a href="user">User</a></li>
			<li class="current"><a href="product.jsp">Product</a></li>
			<li><a href="ordersel">Order</a></li>
			<li><a href="SelManage">Message</a></li>
			<li><a href="newsselect">News</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		Administrator${name.EU_USER_ID}Hello, welcome back to the management background.
	 </div>
</div>
<div id="position" class="wrap">
	current location：<a href="index.jsp">健康花城</a> &gt; Management background
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>User Management</dt>
				<dd><em><a href="user-add.jsp">Add</a></em><a href="user">User Management</a></dd>
				<dt>Product information</dt>
				<dd><em><a href="productClassAdd">Add</a></em><a href="productClass">Category management</a></dd>
				<dd><em><a href="productAdd">Add</a></em><a href="productSelect">Commodity management</a></dd>
				<dt>Order management</dt>
				<dd><a href="ordersel">Order management</a></dd>
				<dt>Message management</dt>
				<dd><a href="SelManage">Message management</a></dd>
				<dt>News management</dt>
				<dd><em><a href="news-add.jsp">Add</a></em><a href="newsselect">News management</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>Product management</h2>
		<div class="pager">
			<ul class="clearfix">
				<li>current:${cpage}/${tpage }page</li>
			    <li><a href="productSelect?cp=1">Mainpage</a></li>
			    <li><a href="productSelect?cp=${cpage-1<=0 ? 1 : cpage-1 }">Previous</a></li>
			    <li><a href="productSelect?cp=${cpage+1>=tpage ? tpage : cpage+1 }">Next page</a></li>
			    <li><a href="productSelect?cp=${tpage }">Last page</a></li>
			    <li><select onchange="jump2(this.value)">
			    	<c:forEach var="i" begin="1" end="${tpage}">
			    	<option ${i==cpage ? "selected" : "" } value="${i}">${i }page</option>
			    	</c:forEach>
			    </select></li>
			</ul>
		</div>
		<br/><br/>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>Product name</th>
					<th>Operation</th>
				</tr>
				<c:forEach var="p" items="${eplist}"> 
					<tr>
						<td class="first w4 c">${p.EP_ID }</td>
						<td class="thumb"><img src="../images/product/${p.EP_FILE_NAME }" width="80" height="80"/><a href="../selectProductView?id=${p.EP_ID }" target="_blank">${p.EP_NAME }</a></td>
						<td class="w1 c"><a href="toProductUpdate?id=${p.EP_ID }">Edit</a> <a href="javascript:productDel(${p.EP_ID })">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="pager">
			<ul class="clearfix">
				<li>current:${cpage}/${tpage }page</li>
			    <li><a href="productSelect?cp=1">Mainpage</a></li>
			    <li><a href="productSelect?cp=${cpage-1<=0 ? 1 : cpage-1 }">Previous</a></li>
			    <li><a href="productSelect?cp=${cpage+1>=tpage ? tpage : cpage+1 }">Next page</a></li>
			    <li><a href="productSelect?cp=${tpage }">Last page</a></li>
			    <li><select onchange="jump2(this.value)">
			    	<c:forEach var="i" begin="1" end="${tpage}">
			    	<option ${i==cpage ? "selected" : "" } value="${i}">${i }page</option>
			    	</c:forEach>
			    </select></li>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>

