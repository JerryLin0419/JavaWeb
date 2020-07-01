<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<script src="${pageContext.request.contextPath}/static/iconfont.js"></script>
<style type="text/css">
* {
	font-size: 27px;
	margin: 0;
	padding: 0;
}
.main{
    margin: 0 auto;
    padding:100px 0;
    height:300px;
    background-image: url(img/d.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-size:cover;
}
header {
	height: 40px;
	background-color: aqua;
}

table {
	margin: 0 auto;
	width: 370px;
	overflow: hidden;
}

#button1 {
	margin: 4px 20px;
	font-size: 22px;
	float: right;
	padding: 2px;
}

#button3{
    font-size: 20px;
    margin: 3px;
    padding:3px;
    heigth:30px;
}
.icon {
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
}

.full{
   width:300px;
   height:38px;
}
</style>
<body>
	<header>
		<div name="relogin" id="button1" onClick="location.href='login.jsp'"  style="cursor:pointer;">
		<svg class="icon" aria-hidden="true" ><use xlink:href="#icon-yemian"></use></svg>切换普通用户
		</div>			
	</header>
	<div class="main">
	<form action="checklogin" method="post">
		<table border="1" cellspacing="0">
			<tr height="40px" align="center">
				<td colspan="2">管理员登陆界面</td>
			</tr>
			<tr height="40px">
				<td align="right">账号:</td>
				<td><input type="text" name="uname" class="full"/></td>
			</tr>
			<tr height="40px">
				<td align="right">密码:</td>
				<td><input type="password" name="upwd" class="full"/></td>
			</tr>
			<tr height="40px" align="center">
				<td colspan="2"><input type="submit" value="  提交  " id="button3"> <input
					type="reset" value="  重置  " id="button3"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
<script>
	
</script>
</html>