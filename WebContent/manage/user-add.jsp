<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Backstage - 健康花城</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="..//scripts/function-manage.js"></script>
<script type="text/javascript" src="..//scripts/calendar.js"></script>
<script type="text/javascript">
function checkusername(){
	var username=document.getElementById("userName").value;
	if(username==""){
		document.getElementById("sp").innerHTML="<font color='red'>Username can not be empty</font>";
		document.getElementById("sb").disabled=true;
	}else{
		document.getElementById("sp").innerHTML="";
		document.getElementById("sb").disabled=false;
	}
}
function checkname(){
	var name1=document.getElementById("name").value;
	if(name1==""){
		document.getElementById("sn").innerHTML="<font color='red'>Name cannot be empty</font>";
		document.getElementById("sb").disabled=true;
	}else{
		document.getElementById("sn").innerHTML="";
		document.getElementById("sb").disabled=false;
	}
   
}
function checkpwd(){
	var passWord=document.getElementById("passWord").value;
	if(passWord==""){
		document.getElementById("spwd").innerHTML="<font color='red'>Password can not be blank</font>";
		document.getElementById("sb").disabled=true;
	}else{
		document.getElementById("spwd").innerHTML="";
		document.getElementById("sb").disabled=false;
	}
}
function checkbirthday(){
	var birthday=document.getElementById("birthday").value;
	if(birthday==""){
		document.getElementById("sbb").innerHTML="<font color='red'>Birthday cannot be empty</font>";
		document.getElementById("sb").disabled=true;
	}else{
		document.getElementById("sbb").innerHTML="";
		document.getElementById("sb").disabled=false;
	}
}

function checkemail(){
	var email=document.getElementById("email").value;
	if(email==""){
		document.getElementById("se").innerHTML="<font color='red'>E-mail can not be empty</font>";
		document.getElementById("sb").disabled=true;
	}else{
		document.getElementById("se").innerHTML="";
		document.getElementById("sb").disabled=false;
	}
}
function checkmobile(){
	var mobile=document.getElementById("mobile").value;
	if(mobile==""){
		document.getElementById("sphone").innerHTML="<font color='red'>Phone cannot be empty</font>";
		document.getElementById("sb").disabled=true;
	}else{
		document.getElementById("sphone").innerHTML="";
		document.getElementById("sb").disabled=false;
	}
}
function checkaddress(){
	var address=document.getElementById("address").value;
	if(address==""){
		document.getElementById("sadd").innerHTML="<font color='red'>Address cannot be empty</font>";
		document.getElementById("sb").disabled=true;
	}else{
		document.getElementById("sadd").innerHTML="";
		document.getElementById("sb").disabled=false;
	}
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
		<h2>Add users</h2>
		<div class="manage">
			<form action="useradd" >
				<table class="form">
					<tr>
						<td class="field">Username：</td>
						<td><input type="text" class="text" name="userName" onblur="check(this.value),checkusername()" id="userName"/><span id="sp"></span></td>
					</tr>
					<tr>
						<td class="field">Name：</td>
						<td><input type="text" class="text" name="name"  onblur="checkname()" id="name"/><span id="sn"></span></td>
					</tr>
					<tr>
						<td class="field">Password：</td>
						<td><input type="text" class="text" name="passWord" value="" onblur="checkpwd()" id="passWord"/><span id="spwd"></span></td>
					</tr>
					<tr>
						<td class="field">Sex：</td>
						<td><input type="radio" name="sex" value="T" checked="checked" />Male <input type="radio" name="sex" value="F" />Female</td>
					</tr>
					<tr>
						<td class="field">Birth：</td>
						<td>
							<input type="text" name="birthday" onfocus="c.showMoreDay = false;c.show(this);"  onblur="checkbirthday()" id="birthday"/><span id="sbb"></span>
						</td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input type="text" class="text" name="email" value="" onblur="checkemail()" id="email"/><span id="se"></span></td>
					</tr>
					<tr>
						<td class="field">Phone number：</td>
						<td><input type="text" class="text" name="mobile" value="" onblur="checkmobile()" id="mobile"/><span id="sphone"></span></td>
					</tr>
					<tr>
						<td class="field">Address：</td>
						<td><input type="text" class="text" name="address" value="" onblur="checkaddress()" id="address"/><span id="sadd"></span></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" disabled=true id="sb" value="Add" /></label></td>
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

