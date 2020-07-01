<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康花城 - Mainpage</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>



<style type="text/css">
#magnifier{
	width:300px;
	height:300px;
	position:absolute;
	/*top:200px;
	left:400px;*/
	font-size:0;
	border:1px solid #000;
}
#img{
	width:300px;
	height:300px;
}
#Browser{
	border:1px solid #000;
	z-index:100;
	position:absolute;
	background:#555;
}
#mag{
	border:1px solid #000;
	overflow:hidden;
	z-index:100;
}
</style>
<script type="text/javascript">
function searchHot(name){
	location.href='selectProductList?name='+name;
}
function getEventObject(W3CEvent) {
	return W3CEvent || window.event;
}
function getPointerPosition(e) {
	e = e || getEventObject(e);
	var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
	var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
	
	return { 'x':x,'y':y };
}
function setOpacity(elem,level) {
	if(elem.filters) {
		elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
	} else {
		elem.style.opacity = level;
	}
}
function css(elem,prop) {	
	for(var i in prop) {
		if(i == 'opacity') {
			setOpacity(elem,prop[i]);
		} else {
			elem.style[i] = prop[i];
		}
	}
	return elem;
}
var magnifier = {
	m : null,
	
	init:function(magni){
		var m = this.m = magni || {
			cont : null,	
			img : null,	
			mag : null,	
			scale : 20	
		}
		
		css(m.img,{	
			'position' : 'absolute',
			'width' : (m.cont.clientWidth * m.scale) + 'px',					
			'height' : (m.cont.clientHeight * m.scale) + 'px'				
			})
		
		css(m.mag,{
			'display' : 'none',
			'width' : m.cont.clientWidth + 'px',	
			'height' : m.cont.clientHeight + 'px',
			'position' : 'absolute',
			'left' : m.cont.offsetLeft + m.cont.offsetWidth + 10 + 'px',
			'top' : m.cont.offsetTop + 'px'
			})
		
		var borderWid = m.cont.getElementsByTagName('div')[0].offsetWidth - m.cont.getElementsByTagName('div')[0].clientWidth;		//获取border的宽
		
		css(m.cont.getElementsByTagName('div')[0],{			
			'display' : 'none',								
			'width' : m.cont.clientWidth / m.scale - borderWid + 'px',			
			'height' : m.cont.clientHeight / m.scale - borderWid + 'px',
			'opacity' : 0.5
			})
		
		m.img.src = m.cont.getElementsByTagName('img')[0].src;
		m.cont.style.cursor = 'crosshair';
		
		m.cont.onmouseover = magnifier.start;
		
	},
	
	start:function(e){
		
		if(document.all){
			magnifier.createIframe(magnifier.m.img);
		}
		
		this.onmousemove = magnifier.move;
		this.onmouseout = magnifier.end;
	},
	
	move:function(e){
		var pos = getPointerPosition(e);		
		
		this.getElementsByTagName('div')[0].style.display = '';
		
		css(this.getElementsByTagName('div')[0],{
			'top' : Math.min(Math.max(pos.y - this.offsetTop - parseInt(this.getElementsByTagName('div')[0].style.height) / 2,0),this.clientHeight - this.getElementsByTagName('div')[0].offsetHeight) + 'px',
			'left' : Math.min(Math.max(pos.x - this.offsetLeft - parseInt(this.getElementsByTagName('div')[0].style.width) / 2,0),this.clientWidth - this.getElementsByTagName('div')[0].offsetWidth) + 'px'			
			})
		
		magnifier.m.mag.style.display = '';
		
		css(magnifier.m.img,{
			'top' : - (parseInt(this.getElementsByTagName('div')[0].style.top) * magnifier.m.scale) + 'px',
			'left' : - (parseInt(this.getElementsByTagName('div')[0].style.left) * magnifier.m.scale) + 'px'
			})
		
	},
	
	end:function(e){
		this.getElementsByTagName('div')[0].style.display = 'none';
		magnifier.removeIframe(magnifier.m.img);		
		
		magnifier.m.mag.style.display = 'none';
	},
	
	createIframe:function(elem){
		var layer = document.createElement('iframe');
		layer.tabIndex = '-1';
		layer.src = 'javascript:false;';
		elem.parentNode.appendChild(layer);
		
		layer.style.width = elem.offsetWidth + 'px';
		layer.style.height = elem.offsetHeight + 'px';
	},
	
	removeIframe:function(elem){
		var layers = elem.parentNode.getElementsByTagName('iframe');
		while(layers.length >0){
			layers[0].parentNode.removeChild(layers[0]);
		}
	}
}
window.onload = function(){
	magnifier.init({
				   cont : document.getElementById('magnifier'),
				   img : document.getElementById('magnifierImg'),
				   mag : document.getElementById('mag'),
				   scale : 3
				   });
}
	function jian(){
		var count = parseInt(document.getElementById("count").value);
		if(count>0){
			count--;
		}
		if(count==0){
			count=1;
		}
		document.getElementById("count").value = count;
	}
	function jia(){
		var count = parseInt(document.getElementById("count").value);
		var stock = parseInt(document.getElementById("stock").innerHTML);
		if(count<stock){
			count++;
		}
		document.getElementById("count").value = count;
	}
	function checkcount(){
		var count = parseInt(document.getElementById("count").value);
		var stock = parseInt(document.getElementById("stock").innerHTML);
		if(count>stock){
			alert('Inventory shortage');
			document.getElementById("count").value = stock;
		}
		if(count==0){
			alert('Purchase quantity cannot be less than 1');
			document.getElementById("count").value = 1;
		}
		if(count<0){
			alert('Error');
			document.getElementById("count").value = 1;
		}
	}
	function shopAdd(idd){
		var id = idd;
		var count = parseInt(document.getElementById("count").value);
		location.href='shopAdd?id='+id+'&count='+count;
	}
	function shopAdd2(idd){
		var id = idd;
		var count = parseInt(document.getElementById("count").value);
		location.href='shopAdd2?id='+id+'&count='+count;
	}
</script>
<script type="text/javascript">
function selectname(){
	  var name = document.getElementById("selectname").value;
	  location.href='selectProductList?name='+name;
}
</script>
</head>
<body style="background: pink">
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.png" /></div>
	<div class="help"><c:if test="${name!=null}"><a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a></c:if><c:if test="${name!=null}">User${name.EU_USER_ID }</c:if><a href="ShopSelect" class="shopping">Cart</a><c:if test="${name==null}"><a href="login.jsp">Login</a>|<a href="register.jsp">Sign in</a></c:if><c:if test="${name!=null}"><a href="zx">Logout</a></c:if><a href="SelallServlet">Message</a><c:if test="${name.EU_STATUS==2}"><a href="manage/index.jsp" >Backstage</a></c:if></div>
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
<div id="position" class="wrap">
	Current location:<a href="indexSelect">健康花城</a> &gt; <a href="selectProductList">Categories</a> &gt; ${title }
</div>
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
	<div id="product" class="main">
		<h1>${p.EP_NAME }</h1>
		<div class="infos">
		<div id="magnifier">
			<img src="images/product/${p.EP_FILE_NAME }" id="img" />
			<div id="Browser"></div>
		</div>
		<div id="mag"><img id="magnifierImg" /></div>

			 
			<div class="buy">
				<p>Mall price：<span class="price">￥${p.EP_PRICE }.00</span></p>
				<p>Post method：<font color="red">EMS</font></p>
				<p>Hot：☆☆☆☆☆</p>
				<p>Stock：<span id="stock">${p.EP_STOCK }</span></p>
				<p>Purchase quantity：<input type="button" value="  -  " onclick="jian()"/><input align="middle" type="text" value="1" id="count" name="count" onblur="checkcount()"/><input type="button" value="  +  " onclick="jia()"/></p>
				<div class="button"><input type="button" name="button" value="" onclick="shopAdd(${p.EP_ID})" /><a href="javascript:shopAdd2(${p.EP_ID})">放入购物车</a></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>Flower mood</strong></h2>
			<div class="text">
				${p.EP_DESCRIPTION }<br />
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2020  健康花城 All Rights Reserved. 
</div>
</body>
</html>

