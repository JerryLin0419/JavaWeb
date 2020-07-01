<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="atex" uri="http://mydomain.com/sample" %>
<html>
<head>
<title>商品管理列表</title>
</head>
<script src="${pageContext.request.contextPath}/static/iconfont.js"></script>
<style type="text/css">

.icon {
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
  cursor:pointer;
}

* {
	margin: 0;
	padding: 0;
	text-align: center;
}

header {
	height: 40px;
	background-color: aqua;
	margin:0;
	padding:0;
	font-size: 27px;
}

#relogin {
	float: right;
	margin: 5px;
	height: 28px;
	width: 60px;
	line-height: 28px;
}

form{
    float:right;
    margin:0 10px;
}
h3{
    margin:3px 30px;
    float:left;
    font-size:28px;
    color:red;
}
h4{
    margin:3px 20px;
    font-weight:normal;
    float:right;
    font-size:18px;
}
.table {
	margin:5px auto;
	padding: 5px;
	width:1115px;
	overflow: hidden;
	background-color: #00FFFF;
}

table {
	width: 350px;
	height: 150px;
	text-align: center;
}

#anchor {
	width: 20%;
	background-color: bisque;
	float: left;
	height: 500px;
}

.part {
	margin: 5px 10px;
	width: 350px;
	height: 150px;
	background-color: yellow;
	float: left;
	overflow: hidden;
}

#add {
	font-size: 50px;
	line-height: 150px;
}
.a{
    float: right;
	margin: 3px;
	height: 28px;
	width: 60px;
	line-height: 28px;
}
#edit{
    width:100px;
    margin:3px 8px 0 0;
}

</style>
<body>
	<header>
		<div name="relogin" id="relogin" onClick="location.href='login2.jsp'" style="cursor:pointer;">
		<svg class="icon" aria-hidden="true"><use xlink:href="#icon-return"></use></svg></div>
	</header>
	<h1>商品列表</h1>
	
	<div class="table">
	<header>
		<h3>${username}</h3>
	<form action="checkProduct" method="post">
		<input id="edit" name="BD" placeholder="商品号" class="a"/> 
		<input type="submit" name="submit" value="查询" class="a" style="cursor:pointer;"/>
	</form>
	</header>
		<c:forEach var="product" items="${applicationScope.productList}">
		<div class="part">
			<table border="1px" cellspacing="1px" cellpadding="0" align="center">
				<tr>
					<td rowspan="3" width="110px"><img src="upload/${product.picid}" width="100px"></td>
					<td>商品名</td>
					<td colspan="3">${product.pname}</td>
				</tr>
				<tr>
					<td>商品号</td>
					<td>${product.id}</td>
					<td>类别</td>
					<td>${product.ptype}</td>
				</tr>
				<tr>
					<td>库存</td>
					<td>${product.pnum}</td>
					<td>价格</td>
					<td>${product.price}</td>
				</tr>
				<tr>
				    <td>${product.id}</td>
					<td colspan="5"><a href="changeProduct?BID=${product.id}">编辑该商品</a></td>
				</tr>
			</table>
		</div>
		</c:forEach>
		<a href="additem.jsp"><button class="part" id="add" style="cursor:pointer;">
		<svg class="icon" aria-hidden="true"><use xlink:href="#icon-add_1"></use></svg></button></a>
		
		<p></p>
		<div class="table"> <h4><atex:time/></h4></div>
	</div>
	
</body>
</html>
