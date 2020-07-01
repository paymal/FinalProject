<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康花城 - Mainpage</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>
<script type="text/javascript" src="scripts/calendar.js"></script>
<script type="text/javascript">
function selectname(){
	  var name = document.getElementById("selectname").value;
	  location.href='selectProductList?name='+name;
}

function searchHot(name){
	location.href='selectProductList?name='+name;
}
</script>

</head>
<body style="background: pink">
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.png" /></div>
	<div class="help"><c:if test="${name!=null}"><a href="selectdd?dd=${name.EU_USER_ID }">Personal order</a></c:if><c:if test="${name!=null}">User${name.EU_USER_ID }</c:if><a href="ShopSelect" class="shopping">Cart</a><c:if test="${name==null}"><a href="login.jsp">Login</a>|<a href="register.jsp">Sign in</a></c:if><c:if test="${name!=null}"><a href="zx">Logout</a></c:if><a href="SelallServlet">Message</a><c:if test="${name.EU_STATUS==2}"><a href="manage/index.jsp" >Backstage</a></c:if></div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="indexSelect">Mainpage</a></li>
		</ul>
	</div>
</div>
<%@ include file="/include/search_bar.jsp" %>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>Welcome to 健康花城</h1>
			<ul class="steps clearfix">
				<li class="current"><em></em>Fill in the registration information</li>
				<li class="last"><em></em>Registration success</li>
			</ul>
			<form id="regForm" method="post" action="register" onsubmit="return checkForm(this);">
				<table>
					<tr>
						<td class="field">Username：</td>
						<td><input class="text" type="text" name="userName" onfocus="FocusItem(this)" onblur="CheckItem(this),check(this.value);" /><span id="sp"></span></td>
					</tr>
					<tr>
						<td class="field">Name：</td>
						<td><input type="text" class="text" name="name"   /></td>
					</tr>
					<tr>
						<td class="field">Password：</td>
						<td><input class="text" type="password" id="passWord" name="passWord" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">Confirm password：</td>
						<td><input class="text" type="password" name="rePassWord" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">Sex：</td>
						<td><input type="radio" name="sex" value="T" checked="checked" />Male <input type="radio" name="sex" value="F" />Female</td>
					</tr>
					<tr>
						<td class="field">Birth：</td>
						<td>
							<input type="text" name="birthday" onfocus="c.showMoreDay = false;c.show(this);" />
						</td>
					</tr>
					<tr>
						<td class="field">E-mail：</td>
						<td><input type="text" class="text" name="email" value="" /></td>
					</tr>
					<tr>
						<td class="field">Phone number：</td>
						<td><input type="text" class="text" name="mobile" value="" /></td>
					</tr>
					<tr>
						<td class="field">Address：</td>
						<td><input type="text" class="text" name="address" value="" /></td>
					</tr>
					<tr>
						<td class="field">Verification code：</td>
						<td><input class="text verycode" type="text" name="veryCode" onfocus="FocusItem(this)" onblur="Checknum(this);" /><img id="veryCode" alt="Can't see clearly, change one" style="cursor:hand;" src="usernum?<%=new Date().getTime() %>" onclick="change(this)" /><span id="msg"></span></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" disabled=true id="sub" value="Submit" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2020  健康花城 All Rights Reserved. 
</div>
</body>
</html>

