<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String URL = "jdbc:mysql://localhost:3306/cart?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false&allowPublicKeyRetrieval=true";
		String USERNAME = "root";
		String PWD = "123456";
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); //加载具体驱动类
			connection = DriverManager.getConnection(URL, USERNAME, PWD); //连接数据库
			stmt = connection.createStatement(); // 执行
			String upwd = request.getParameter("upwd");
			String uname = request.getParameter("uname");
			request.setAttribute("uname", uname);
			String sql = "select COUNT(*) from `user` where `uname` = '" + uname + "' and `upwd`='" + upwd + "'";
			rs = stmt.executeQuery(sql);
			int count = -1;
			if (rs.next()) {
				count = rs.getInt(1);
			}
			if (count > 0) {
				if ((request.getParameter("check") != null) && (request.getParameter("check").equals("check"))) {
					Cookie nameCookie = new Cookie("usernamecheck", uname);
					Cookie pswdCookie = new Cookie("passwordcheck", upwd);
					nameCookie.setMaxAge(160);
					pswdCookie.setMaxAge(160);
					response.addCookie(nameCookie);
					response.addCookie(pswdCookie);
				} else {
					if ((request.getParameter("remind") != null)
							&& (request.getParameter("remind").equals("remind"))) {
						Cookie nameCookie = new Cookie("usernameremind", uname);
						Cookie pswdCookie = new Cookie("passwordremind", upwd);
						nameCookie.setMaxAge(160);
						pswdCookie.setMaxAge(160);
						response.addCookie(nameCookie);
						response.addCookie(pswdCookie);
					}
				}
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>
