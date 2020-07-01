<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户购物车信息</title>
</head>
<script src="${pageContext.request.contextPath}/static/iconfont.js"></script>
<style>
.icon {
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
}

a{
  float:right;
  margin:10px;
}
</style>

<body>
	<center>

		<p>购物车信息</p>
		<table>
			<tr>
				<td style='width: 50px'>数量</td>
				<td style='width: 200px'>商品</td>
				<td style='width: 80px'>价格</td>
				<td style='width: 80px'>小计</td>
				<td style='width: 80px'>是否删除</td>
			</tr>
			<c:forEach var="item" items="${sessionScope.cart.items}">
				<tr>
					<td>${item.quantity}</td>
					<td>${item.product.pname}</td>
					<td>${item.product.price}</td>
					<td>${(item.product.price*item.quantity*100)/100.00}</td>
					<td><a href="deleteItem?id=${item.product.id}">删除</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan='4' style='text-align: right'>总计:${sessionScope.cart.total}</td>
			</tr>
        <tr><td colspan='10'>
        <a href="cleanItem"><svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-wage"></use></svg>结算</a>
        <a href="index.jsp"><svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-return"></use></svg>继续购物</a>
		</td>
			</tr>
		</table>
		
	</center>
</body>
</html>
