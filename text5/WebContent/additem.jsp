<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品添加</title>
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
	margin: 5px;
}

h1 {
margin:60px;
	text-align: center;
}
h3 {
	text-align: center;
}
div {
	margin: 50px auto;
	width: 285px;
}

.a {
	width: 70px;
	align: center;
	margin: 0 auto;
	padding:5px;
}

.b {
	width: 170px;
}

.c {
	width: 50px;
}

.d {
	width: 166px;
}
</style>
</body>
<h1>商品添加</h1>
<div>
	<form action="UploadServlet" method="post" enctype="multipart/form-data">
		商品名：<input name="pname" class="d" /><br /> 
		商品号：<input name="id" class="c" /> 
		库存：<input name="pnum" class="c" /><br /> 
		产品类：<input name="ptype" class="c" /> 
		价格：<input name="price" class="c" /><br />
		商品图：<input type="file" name="spicture" class="b" /><br />
		<h3><input type="submit" name="submit" value="上传" class="a" /></h3>
		
	</form>
</div>
</body>
</html>