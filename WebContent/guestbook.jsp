<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.hr.entity.EASYBUY_COMMENT"%>
<%@page import="com.hr.entity.EASYBUY_USER"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康花城 - Mainpage</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>
<script type="text/javascript" charset="utf-8" src="kindeditor.js"></script>
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
	Current location<a href="index.jsp">健康花城</a> &gt; Online message
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
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
	</div>
</div>
	<div class="main">
		<div class="guestbook">
			<h2>All Messages</h2>
			<ul>
				<li>
				<% 
				 int cpage=(Integer)request.getAttribute("page");
				 int max_page=(Integer)request.getAttribute("max_page");
				//ArrayList<EASYBUY_COMMENT> list=(ArrayList<EASYBUY_COMMENT>)request.getAttribute("list"); 
				 
					//for(EASYBUY_COMMENT comment:list){
				%>
				<c:forEach var="comment" items="${list}" >
					<dl>
						<dt>${comment.EC_CONTENT }</dt>
						<dd class="author">Netizen：${comment.EC_NICK_NAME }
						<span class="timer">  ${comment.EC_CREATE_TIME }</span></dd>
						<dd><c:if test="${empty comment.EC_REPLY}">
								Unanswered
						</c:if>
						<c:if test="${not empty comment.EC_REPLY}">
								Reply：<c:out value="${comment.EC_REPLY }"  />
						</c:if></dd>
						
					</dl>
					</c:forEach>
						
				</li>
			
			</ul>
			<div class="clear"></div>
			<div class="pager">
				<ul class="clearfix">
					<% if(cpage!=1){ %>
					<li><a href="SelallServlet?page=<%=cpage-1%>">Previous</a></li>
				<% }%>
					<%for(int i=1;i<=max_page;i++){ %>
					<li><a href="SelallServlet?page=<%=i%>"><%=i %></a></li>
					<%} %>
				<%if(cpage!=max_page){ %>
					<li><a href="SelallServlet?page=<%=cpage+1%>">Next page</a></li>
 
				<%	
				} %>
				</ul>
			</div>
			<div id="reply-box">
				<form action="GueServlet" method="post">		
					<table>	
						<tr>
							<td class="field">Nickname：</td>
				<td><input class="text" name="guestName" /></td>
						</tr>
						<tr>
							<td class="field">Message content：</td>
							<td>
							<textarea id="content_1" name="guestContent" ></textarea>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><label class="ui-blue"><input type="submit" name="submit" value="Submit Message" /></label></td>
						</tr>
					</table>
				</form>
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
