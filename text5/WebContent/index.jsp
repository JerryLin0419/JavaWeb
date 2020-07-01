<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>购物系统首页面</title>
</head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-align: center;
}

header {
	height: 40px;
	background-color: aqua;
	margin: 5px;
}

button {
	float: right;
	margin: 5px;
	height: 30px;
	width: 60px;
}

.table {
	margin: 5px auto;
	padding: 5px;
	overflow: hidden;
	background-color: #00FFFF;
	width: 1115px;
}

#anchor {
	width: 20%;
	background-color: bisque;
	float: left;
	height: 500px;
}

table {
	width: 350px;
	height: 150px;
	text-align: center;
}

.part {
	margin: 10px;
	width: 350px;
	height: 150px;
	background-color: yellow;
	float: left;
	overflow: hidden;
}

#add {
	font-size: 50px;
	line-height: 200px;
}
</style>
<body>
	<header>
		<button name="relogin" id="relogin"
			onClick="location.href='login.jsp'">注销</button>
		<button name="check" id="check" onClick="location.href='showCart.jsp'">购物车</button>
	</header>
	<h1>商品列表</h1>
	<div class="table">
		<c:forEach var="product" items="${applicationScope.productList}">
			<div class="part">
				<table border="1px" cellspacing="1px" cellpadding="0" align="center">
					<tr>
						<td rowspan="3" width="110px"><img
							src="upload/${product.picid}" width="100px"></td>
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
						<td colspan="5"><a href="showProduct?id=${product.id}">详细信息</a></td>
					</tr>
				</table>

			</div>
		</c:forEach>
	</div>
</body>
</html>
