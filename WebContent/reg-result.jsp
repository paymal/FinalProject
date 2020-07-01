<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康花城 - mainpage</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>
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
			<h1>Welcome to register 健康花城</h1>
			<ul class="steps clearfix">
				<li class="finished"><em></em>Fill in the registration information</li>
				<li class="last-current"><em></em>Registration success</li>
			</ul>
			<div class="msg">
				<p>Congratulations: the registration is successful!</p>
				<p>Entering mainpage...</p>
				<script type="text/javascript">
					setTimeout("location.href='indexSelect'", 3000);
				</script>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	Copyright &copy; 2020  健康花城 All Rights Reserved. 
</div>
</body>
</html>

