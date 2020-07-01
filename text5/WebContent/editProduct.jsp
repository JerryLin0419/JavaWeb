<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>显示商品详细信息</title>
</head>
<script src="${pageContext.request.contextPath}/static/iconfont.js"></script>
<style type="text/css">
.icon {
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
}

div a{
margin:0 8px 0 0;
float:left;
text-decoration: none;
}
</style>
<body>
	<center>
		<h3>商品详细信息</h3>
		<form name="myform" method='post' action='changeProduct'>
			<input type='hidden' name='Id' value='${product.id}' />
			<table>
				<tr>
					<td>商品名:</td>
					<td><input id="edit" name="Pname" placeholder="${sessionScope.product2.pname}" class="a"/> </td>
				</tr>
				<tr>
					<td>价格:</td>
					<td><input id="edit" name="Price" placeholder="${sessionScope.product2.price}" class="a"/> </td>
				</tr>
				<tr>
					<td>库存量:</td>
					<td><input id="edit" name="Pnum" placeholder="${sessionScope.product2.pnum}" class="a"/> </td>
				</tr>
				<tr>
					<td>类型:</td>
					<td><input id="edit" name="Ptype" placeholder="${sessionScope.product2.ptype}" class="a"/> </td>
				</tr>
				<tr>
					<td colspan='3'>
					 <div><a href="changeProduct?BID=${sessionScope.product2.id}" class="a">
					 <svg class="icon" aria-hidden="true"><use xlink:href="#icon-edit"></use></svg>编辑</a> </div>
					<div><a href="deleteProduct?BID=${sessionScope.product2.id}" class="a">
					<svg class="icon" aria-hidden="true"><use xlink:href="#icon-delete"></use></svg>删除</a> </div>	 
					<div><a href="DownloadServlet?BID=${sessionScope.product2.id}" class="a">
					<svg class="icon" aria-hidden="true"><use xlink:href="#icon-download"></use></svg>取图</a> </div>	 
					<div><a href='addProduct.jsp'>
					<svg class="icon" aria-hidden="true"><use xlink:href="#icon-return"></use></svg>返回</a>    </div>          
					</td>
				</tr>
			</table>
		</form>
		</center>
</body>
</html>
