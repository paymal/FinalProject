<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康花城 - Mainpage</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>

<script language="javascript">

function ScrollImgLeft(){
var speed=20
var scroll_begin = document.getElementById("scroll_begin");
var scroll_end = document.getElementById("scroll_end");
var scroll_div = document.getElementById("scroll_div");
scroll_end.innerHTML=scroll_begin.innerHTML
function Marquee(){
    if(scroll_end.offsetWidth-scroll_div.scrollLeft<=0)
      scroll_div.scrollLeft-=scroll_begin.offsetWidth
    else
      scroll_div.scrollLeft++
}
var MyMar=setInterval(Marquee,speed)
scroll_div.onmouseover=function() {clearInterval(MyMar)}
scroll_div.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
}
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
			<c:choose>
			<c:when test="${empty selected_fid}">
			<li class="current" ><a href="indexSelect">Mainpage</a></li>
			</c:when>
			<c:otherwise>
			<li ><a href="indexSelect">Mainpage</a></li>
			</c:otherwise>
			</c:choose>
			<c:forEach var="f" items="${flist}">
			<c:choose>
			<c:when test="${selected_fid == f.EPC_ID}">
			<li class="current" ><a href="selectProductList?fid=${f.EPC_ID }">${f.EPC_NAME }</a></li>
			</c:when>
			<c:otherwise>
			<li><a href="selectProductList?fid=${f.EPC_ID }">${f.EPC_NAME }</a></li>
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</ul>
	</div>
</div>
<%@ include file="/include/search_bar.jsp" %>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>Categories</h2>
			<dl>
				<dt><a href="selectProductList">All products</a></dt>
				<c:forEach var="f" items="${flist}">
					<dt><a href="selectProductList?fid=${f.EPC_ID }">${f.EPC_NAME }</a></dt>
					<c:forEach var="c" items="${clist}">
						<c:if test="${f.EPC_ID==c.EPC_PARENT_ID}">
							<c:if test="${p.EPC_CHILD_ID!=c.EPC_ID}">
								<dd><a href="selectProductList?cid=${c.EPC_ID }">${c.EPC_NAME }</a></dd>
							</c:if>
						</c:if>
					</c:forEach> 
				</c:forEach> 
			</dl>
		</div>
		<div class="spacer"></div>
		<div class="last-view">
			<h2>Recently Viewed</h2>
			<dl class="clearfix">
				<c:forEach var="lastp" items="${lastlylist}">
					<dt><a href="selectProductView?id=${lastp.EP_ID }"><img height="40" src="images/product/${lastp.EP_FILE_NAME }" /></a></dt>
					<dd><a href="selectProductView?id=${lastp.EP_ID }">${lastp.EP_NAME }</a></dd>
				</c:forEach>
			</dl>
		</div>
	</div>
	

	<div class="main">
		<div class="price-off">
			<h2>Personal order</h2>
			<c:if test="${not empty dan}">
			<table border="1"  width="600px" height="100px" bordercolor="red">
				<tr  align="center">
					<td class="field">Order number</td>
					<td class="field">User ID</td>
					<td class="field">Product name</td>
					<td class="field">Product image</td>
					<td class="field">Product price</td>
					<td class="field">Purchase quantity</td>
					<td class="field">Commodity stocks</td>
				</tr>
				<c:forEach var="d" items="${dan}">
					<tr align="center">
						<td>${d.EO_ID }</td>
						<td>${d.EO_USER_ID }</td>
						<td>${d.EP_NAME }</td>
						<td><img src="images/product/${d.EP_FILE_NAME }"  height="100" width="100"/></td>
						<td>${d.EP_PRICE }</td>
						<td>${d.EOD_QUANTITY }</td>
						<td>${d.EP_STOCK }</td>
					</tr>
					</c:forEach>
			</table>
			</c:if>
			<c:if test=" ${dan==null}">
				<a href="indexSelect">Go buy now!</a>
			</c:if>
		</div>
	
	</div>
	</div>
<div id="footer">
	Copyright &copy; 2020  健康花城 All Rights Reserved. 
</div>
</body>
</html>


