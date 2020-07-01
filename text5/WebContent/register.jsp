<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册界面</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jQurey.js"></script>
<script src="${pageContext.request.contextPath}/static/iconfont.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-size: 20px;
}

header {
	height: 40px;
	background-color: aqua;
}

#button1 {
	margin: 4px 20px;
	font-size: 22px;
	float: right;
	padding: 2px;
}

table {
	margin: 60px auto;
}

tr {
	height: 40px;
	text-align: center;
}

td {
	text-align: center;
	width: 80px;
}

#indexname {
	height: 40px;
	width: 120px;
	border: none;
}

.index {
	height: 40px;
	margin-left: -80px;
	width: 241px;
	border: none;
	text-align: left;
}

#phone {
	width: 160px;
}

#selectbox {
	width: 120px;
	height: 40px;
	border: none;
}

#selectbox3 {
	height: 40px;
	width: 160px;
}

#button {
	margin: auto;
	width: 80px;
}

.icon {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
}
</style>
</head>
<script type="text/javascript">
	function register() {
		var $uname = $("#index").val();
		console.log($uname);
		$.get("loginnumServlet", "uname=" + $uname, function(result) {
			console.log(result);
			if (result == "true") {
				alert("警告：该账号已存在");
			} else {
			}
		});
	}
</script>
<body>
	<header>
		<div name="relogin" id="button1"
			onClick="location.href='login.jsp'" style="cursor:pointer;"><svg class="icon" aria-hidden="true" ><use xlink:href="#icon-return"></use></svg>登陆界面</div>
	</header>
	<form action="register" method="post">
		<table border='1px' cellspacing="0" padding='0'>
			<tr>
				<td colspan="6">注册信息
			</tr>
			<tr>
				<td id='phone' rowspan="4" colspan="2" align="center" width="160px">➕</td>
				<td>昵称</td>
				<td><input type="text" id="indexname" name="name" /></td>
				<td>性别</td>
				<td><input type="radio" name="sex" checked="true" value="男">男
					<input type="radio" name="sex" value="女">女</td>
			</tr>
			<tr>
				<td>账号</td>
				<td colspan="3"><input type="text" id="index" class="index"
					name="uname" onblur="register()" /></td>
				<!-- <input type="button" value="0v0" onclick="register()"/> -->
			</tr>
			<tr>
				<td>密码</td>
				<td colspan="3"><input type="text" id="index" class="index"
					name="upwd" /></td>
			</tr>
			<tr>

				<td>年龄</td>
				<td><select name="selectbox1" id="selectbox">
						<option></option>
						<option>20</option>
						<option>21</option>
						<option>22</option>
						<option>23</option>
						<option>24</option>
						<option>25</option>
						<option>26</option>
						<option>27</option>
						<option>28</option>
						<option>29</option>
						<option>30</option>
						<option>31</option>
						<option>32</option>
						<option>33</option>
						<option>34</option>
						<option>35</option>
						<option>36</option>
						<option>37</option>
						<option>38</option>
						<option>39</option>
				</select></td>
				<td>兴趣</td>
				<td><select name="selectbox2" id="selectbox">
						<option></option>
						<option>唱</option>
						<option>跳</option>
						<option>rap</option>
						<option>篮球</option>
				</select></td>
			</tr>

			<tr>
				<td colspan="6"><input type="submit" id='button' value="提交">
					<input type="reset" id='button' value="重置"></td>
					
			</tr>
		</table>
	</form>

</body>
</html>