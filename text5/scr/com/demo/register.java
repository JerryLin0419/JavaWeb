package com.demo;
import java.io.*;
import java.sql.*;
import javax.sql.DataSource;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@WebServlet("/register")
public class register extends HttpServlet{
   private static final long serialVersionUID = 1L; 
   DataSource dataSource;
   public void init() {   
      try{
	      Context context = new InitialContext();
	      dataSource = (DataSource)context.lookup("java:comp/env/jdbc/productDS");  
      }catch(NamingException ne){
          System.out.println(ne);
          getServletContext().log("驱动程序类找不到！");   
      }
   }
   
   public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
                 throws ServletException,IOException{
	   Connection dbconn = null;
	   String uname = request.getParameter("uname");
	   String upwd = request.getParameter("upwd");
	   try {
			dbconn = dataSource.getConnection();
			String sql = "INSERT INTO user(uname,upwd) VALUES (?,?)";
			PreparedStatement pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1,uname);
			pstmt.setString(2,upwd);
			int rst = pstmt.executeUpdate();
			if (rst!=0) {
				request.setAttribute("message","注册成功!账号："+uname+"密码："+upwd);
				//response.sendRedirect("login.jsp");
				getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			}
      }catch(SQLException e){
  	      e.printStackTrace();
      }finally {
          try {
 	         dbconn.close();
 	      }catch(Exception e){
 		     e.printStackTrace();
         }
      }
   }
}