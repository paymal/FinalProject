<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hr.entity.EASYBUY_COMMENT"%>
<%@page import="com.hr.dao.EASYBUY_COMMENTDao"%>
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
			<li><a href="ordersel">Order</a></li>
			<li class="current"><a href="SelManage">Message</a></li>
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
		<h2>Message management</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Content</th>
					<th>Status</th>
					<th>Operation</th> 
				</tr>
				<%  
  				 int cpage=(Integer)request.getAttribute("page");
				 int max_page=(Integer)request.getAttribute("max_page"); 
				
				 ArrayList<EASYBUY_COMMENT> list=(ArrayList<EASYBUY_COMMENT>)request.getAttribute("list");
				for(EASYBUY_COMMENT comment:list){
				 %>
				 
				<tr>
					<td class="first w4 c"><%=comment.getEC_ID() %></td>
					<td class="w1 c"><%=comment.getEC_NICK_NAME() %></td>
					<td><%=comment.getEC_CONTENT() %></td>
						<%if(comment.getEC_REPLY()==null || "".equals(comment.getEC_REPLY())) {%>
						<td class="w1 c">Unanswered</td>
					<%}else{ %>
						<td class="w1 c">Answered</td>
					<%} %>
					<td class="w1 c">
					<%if(comment.getEC_REPLY()==null || "".equals(comment.getEC_REPLY())){ %>
						<a href="UpdateManage?id=<%=comment.getEC_ID()%>">Reply</a> 
					<%} %>
						
						<a href="javascript:DelManage(<%=comment.getEC_ID()%>)">Delete</a>
					</td>
				</tr>
				<%
				}
				 %>
			</table>
			<div class="pager">
				<ul class="clearfix">
				<% if(cpage!=1){ %>
					<li><a href="SelManage?page=<%=cpage-1%>">Previous</a></li>
				<% }%>
					<%for(int i=1;i<=max_page;i++){ %>
					<li><a href="SelManage?page=<%=i%>"><%=i %></a></li>
					<%} %>
				<%if(cpage!=max_page){ %>
					<li><a href="SelManage?page=<%=cpage+1%>">Next page</a></li>
 
				<%	
				} %>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
