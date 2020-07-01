<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<script src="${pageContext.request.contextPath}/static/iconfont.js"></script>
<style type="text/css">
* {
    margin: 0;
	padding: 0;
	font-size: 27px;
}

header {
    margin:0;
	height: 40px;
	background-color: aqua;
}

table {
	margin: 60px auto;
	width: 400px;
	overflow: hidden;
	padding:0;
}

#button1{
    font-size: 22px;
    margin: 4px 20px;
    float:right;
}

#button3{
    font-size: 20px;
    margin: 3px;
    padding:3px;
    heigth:30px;
}

#full{
    width:100%;
    height: 40px;
}

.forwatch{
    font-size: 24px;
}

.icon {
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
}

</style>
<body>

	<header>
		<div name="relogin" id="button1" onClick="location.href='login2.jsp'" style="cursor:pointer;">
		<svg class="icon" aria-hidden="true"><use xlink:href="#icon-guanliyuan"></use></svg>管理者登陆</div>
		<div name="check" id="button1" onClick="location.href='register.jsp'" style="cursor:pointer;">
		<svg class="icon" aria-hidden="true"><use xlink:href="#icon-zhuce"></use></svg>新用户注册</div>
	</header>
	
	<%!String uname = "", upwd = "", aname = "", apwd = "";%>
	<%
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("usernameremind"))
					uname = cookie.getValue();
				if (cookie.getName().equals("passwordremind"))
					upwd = cookie.getValue();
			}
		}
	%>
	<form action="check.jsp" method="post">
		<table border="1" cellspacing="0">
			<tr height="40px" align="center">
				<td colspan="2">购物车系统登陆界面</td>
			</tr>
			<tr height="40px">
				<td style="width=200px;">
				<svg class="icon" aria-hidden="true">
				<use xlink:href="#icon-yemian"></use>
				</svg>账号</td>
				<td style="width=100px;">
				<input type="text" name="uname" id="full" 
					value="<%=(uname == null ? "" : uname)%>" /></td>
			</tr>
			<tr height="40px">
				<td style="width=200px;">
				<svg class="icon"  aria-hidden="true">
				<use xlink:href="#icon-mima"></use>
				</svg>密码</td>
				<td style="width=200px">
				<input type="password" name="upwd" id="full" 
					value="<%=(upwd == null ? "" : upwd)%>" /></td>
			</tr>
			<tr height="40px" align="center" >
				<td colspan="2" class="forwatch"><input type="checkbox" name="check"
					value="check" />自动登录 <input type="checkbox" name="remind"
					value="remind" />记住密码</td>
			<tr>
			<tr height="40px" align="center">
				<td colspan="2">
				<input type="submit" value="  提交  "  id="button3"> 
				<input type="reset" value="  重置  "  id="button3"></td>
			</tr>
		</table>
	</form>
	<!--<span>默认账号：1001，密码：123456</span>  -->
	<div id="ccheck"><%=(aname == null ? "" : aname)%></div>
	<center>${message}</center>
</body>
<script>
	function a() {
		window.location.href = "index.jsp";
	}
	function getCookie(name) {
		var strcookie = document.cookie;
		var arrcookie = strcookie.split("; ");
		for (var i = 0; i < arrcookie.length; i++) {
			var arr = arrcookie[i].split("=");
			if (arr[0] == name) {
				return arr[1];
			}
		}
		return "";
	}

	window.onload = function() {
		var user = getCookie("usernamecheck");
		if (user != null && user != "") {
			setTimeout("a()", 1000);
		}
	}
</script>
</html>