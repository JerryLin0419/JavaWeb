<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

* {
    margin: 0;
	padding: 0;
	font-size: 27px;
	text-align: center;
}

header {
    margin:0;
	height: 40px;
	background-color: aqua;
}

#button1{
    font-size: 22px;
    margin: 4px 20px;
    float:right;
}

h3{
   margin:90px;
   color: red;
   font-weight: bold;
}
</style>
<body>
      <header>
		<div name="relogin" id="button1" onClick="location.href='index.jsp'" style="cursor:pointer;">
		<svg class="icon" aria-hidden="true"><use xlink:href="#icon-icon40-copy"></use></svg></div>
		<div name="check" id="button1" onClick="location.href='showCart.jsp'" style="cursor:pointer;">
		<svg class="icon" aria-hidden="true"><use xlink:href="#icon-return"></use></svg></div>
	</header>
    <h3>购买成功,共计￥${total}</h3>
</body>
</html>