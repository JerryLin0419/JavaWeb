<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jQurey.js"></script>
</head>
<script type="text/javascript">
    function register() {
		var $unum = $("#unum").val();
		$.get(
			"loginnumServlet",
			"unum="+$unum,
			function(result){
				if(result == "true"){
					alert("exist，error");
				}else{
					alert("not exist ，success");
				}
			}
		);
	}
</script>
<body>
<input id="unum"/>
<br/>
<input type="button" value="注册" onclick="register()"/>
</body>
</html>