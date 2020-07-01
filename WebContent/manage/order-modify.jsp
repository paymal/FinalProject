 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Backstage - 健康花城</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body style="background: pink">
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.png" /></div>
	<div class="help"><a href="../indexSelect">Return to the front page</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">Mainpage</a></li>
			<li><a href="user">User</a></li>
			<li><a href="productSelect">Product</a></li>
			<li class="current"><a href="ordersel">Order</a></li>
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
		<h2>Edit order</h2>
		<div class="manage">
			<form action="douporder">
				<table class="form">
					<tr>
						<td class="field">Order ID：</td>
						<td><input type="text" class="text" name="orderId" value="${order.EO_ID }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">Orderer's name：</td>
						<td><input type="text" class="text" name="name" value="${order.EO_USER_NAME }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">Address</td>
						<td><input type="text" class="text" name="addres" value="${order.EO_USER_ADDRESS }"  readonly="readonly"/></td>
					</tr>
					<tr>
						<td class="field">Total cost</td>
						<td><input type="text" class="text" name="cost" value="${order.EO_COST }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">Order Status</td>
						<td >
							<select name="tatus" onchange="change(this,${order.EO_STATUS })">
								<option value="1" ${order.orderStatusStr=="Pending review" ? "selected" : ""}>Pending review</option>
								<option value="2" ${order.orderStatusStr=="Examination passed" ? "selected" :""}>Examination passed</option>
								<option value="3" ${order.orderStatusStr=="Distribution" ? "selected" : ""}>Distribution</option>
								<option value="4" ${order.orderStatusStr=="Shipping" ? "selected" : ""}>Shipping</option>
								<option value="5" ${order.orderStatusStr=="Receipt confirmation" ? "selected" : ""}>Receipt confirmation</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="Uplate" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="main">
		<h2>Order details</h2>
		<div class="manage">
				<table border="1"  width="600px" height="100px" bordercolor="red">
					<tr align="center">
						<td class="field">Product name</td>
						<td class="field">Product image</td>
						<td class="field">Product price</td>
						<td class="field">Purchase quantity</td>
						<td class="field">Commodity stocks</td>
					</tr>
					<c:forEach var="d" items="${dlist}">
					<tr align="center">
						<td>${d.EP_NAME }</td>
						<td><img src="../images/product/${d.EP_FILE_NAME }"  height="100" width="100"/></td>
						<td>${d.EP_PRICE }</td>
						<td>${d.EOD_QUANTITY }</td>
						<td>${d.EP_STOCK }</td>
					</tr>
					</c:forEach>
				</table>
			</div>	
	  </div>
	<div class="clear"></div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
