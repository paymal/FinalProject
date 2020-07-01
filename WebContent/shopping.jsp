<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@page import="com.hr.entity.eb_shop"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康花城 - Mainpage</title>
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
			<c:choose>
			<c:when test="${empty selected_fid}">
			<li class="current" ><a href="indexSelect">首页</a></li>
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
<div id="position" class="wrap">
	Current location:<a href="index.html">健康花城</a> &gt; Cart
</div>
<div class="wrap">
	<div id="shopping">
		<form action="gmServlet">
		
			<table>
				<tr>
					<th>Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Operate</th>
				</tr>
				<c:forEach var="rs" items="${requestScope.shoplist}">
					
					<tr id="product_id_1">
						<td class="thumb"><input type="checkbox" name="op" onclick="dxcheck()" /><img src="images/product/${rs.es_ep_file_name }" height="100" width="100" />
						<a href="product-view.html">${rs.es_ep_name }</a></td>
						<td class="price" id="price_id_1">
							<span id="priceText" name="priceText" >${rs.es_ep_price}</span><!-- Commodity price --><input type="hidden" name="sPPrice" value="${rs.es_ep_price}" />
							<input type="hidden" value="99" />
						</td>
						<td class="number">
							<dl>
								<dt>
								<input type="button"  value="-" onclick="sub(${rs.es_id})" />
								<!-- Cartid --><input type="hidden" name="esID" value="${rs.es_id}" />
								<!-- Goodsid --><input type="hidden" name="spID" value="${rs.es_ep_id}" />
								<!-- Quantity --><input id="${rs.es_id}" type="text" name="number" value="${rs.es_eod_quantity }"  onblur="closeText(id,${rs.es_ep_stock})" />
								<input type="button"  value="+" onclick="plus(${rs.es_id},${rs.es_ep_stock}) " />
								</dt>
								
							</dl>
						</td>
						<td class="delete"><a href="javascript:del(${rs.es_id});">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
			<input type="checkbox" onclick="qxcheck()" name="op2" />Select all <div align="right" >Total price:<span id="zdzj">0</span>yuan</div>
														<input type="hidden" name="jstext" id="jstext" value="0" />
			<div align="center"><span id="xzText">Please select an item! ! !</span></div>
			<div class="button"><input style="display:none;" type="submit" value="" id="jsbutton"  /></div>
		</form>
	</div>
	<script type="text/javascript">
		document.write("Shopping cart product ID recorded in cookie:"+ getCookie("product") + "，Can be read in dynamic pages");
	</script>
</div>
<div id="footer">
	Copyright &copy; 2020  健康花城  All Rights Reserved.
</div>
</body>
</html>
<script>
	function plus(id,stock){
		var va=document.getElementById(id).value;
		if(va>=stock){
			return;
		}
		location.href="UpdateServlet?pid="+id+"&action=jia";
		
	}
	function sub(id){
		var va=document.getElementById(id).value;
		if(va<=1){
			return;
		}
		location.href="UpdateServlet?pid="+id+"&action=jian";
		
	}
	function closeText(id,stock){
		var va=document.getElementById(id).value;
		if(va<1){
		alert('The quantity you enter cannot be less than 1! ! !')
			document.getElementById(id).value=1;
			va=1;
		}
		if(va>stock){
		alert('The quantity you entered exceeds the inventory! ! !');
			document.getElementById(id).value=stock;
			va=stock;
		}
		location.href="UpdateServlet?pid="+id+"&getvalue="+va+"&action=closeText";
	}
	function del(id){
	if(confirm("You sure you want to delete it?")) {
		location.href="UpdateServlet?pid="+id+"&action=delText";
		}
	}
	

	var fxi=0;
	function qxcheck(){
	
		var op2 = document.getElementsByName("op2");
		var op =  document.getElementsByName("op");
		
		if(fxi==0){
			for(var i=0;i<op.length;i++)
			{
				op[i].checked=true;
			}
			fxi=1;
		}else{
			for(var i=0;i<op.length;i++)
			{
				op[i].checked=false;
			}
			fxi=0;
		}
		dxcheck();
	}
	function dxcheck(){
	var sum=0;
		var op = document.getElementsByName("op");
		var price=document.getElementsByName("priceText");
		var number=document.getElementsByName("number");
		for(var i=0;i<op.length;i++)
		{
			if(op[i].checked)
			{
				sum+=parseInt(parseInt(price[i].innerText)*parseInt(number[i].value));
			}
		}
			
		document.getElementById("zdzj").innerHTML=sum;	
		document.getElementById("jstext").value=sum;
		var money=document.getElementById("zdzj").innerText;
		if(money=="0"){
			document.getElementById("jsbutton").style.display='none';
			document.getElementById("xzText").hidden=false;
		}else{
			document.getElementById("xzText").hidden=true;
			document.getElementById("jsbutton").style.display='inline';
		}
	}
	
</script>
<!--          -->