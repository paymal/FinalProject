<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Backstage - 健康花城</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
<script type="text/javascript" src="..//scripts/calendar.js"></script>
</head>
<body style="background: pink">
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.png" /></div>
	<div class="help"><a href="../indexSelect">Return to the front page</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">Mainpage</a></li>
			<li class="current"><a href="user">User</a></li>
			<li><a href="productSelect">Product</a></li>
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
		<h2>Edit user</h2>
		<div class="manage">
			<form action="userdoupdate">
				<input type="hidden" name="userStatus" value="${user.EU_STATUS }" />
				<table class="form">
					<tr>
						<td class="field">Username：</td>
						<td><input type="text" class="text" name="userName" value="${user.EU_USER_ID }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">Name：</td>
						<td><input type="text" class="text" name="name" value="${user.EU_USER_NAME }" /></td>
					</tr>
					<tr>
						<td class="field">Password：</td>
						<td><input type="text" class="text" name="passWord" value="${user.EU_PASSWORD }" /></td>
					</tr>
					<tr>
						<td class="field">Sex：</td>
						<td><input type="radio" name="sex" value="T" ${user.EU_SEX=='T' ? "checked" :""}  />Male <input type="radio" name="sex" value="F" ${user.EU_SEX=='F' ? "checked" :""}/>Female</td>
					</tr>
					<tr>
						<td class="field">Birth：</td>
						<td>
							<input type="text" name="birthday" onfocus="c.showMoreDay = false;c.show(this);" value="${user.EU_BIRTHDAY }" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input type="text" class="text" name="email" value="${user.EU_EMAIL }" /></td>
					</tr>
					<tr>
						<td class="field">Phone number：</td>
						<td><input type="text" class="text" name="mobile" value="${user.EU_MOBILE}" /></td>
					</tr>
					<tr>
						<td class="field">Address：</td>
						<td><input type="text" class="text" name="address" value="${user.EU_ADDRESS }" /></td>
					</tr>
					
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="Update" /></label></td>
					</tr>
				
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
