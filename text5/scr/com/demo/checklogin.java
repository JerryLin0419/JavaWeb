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

@WebServlet("/checklogin")
public class checklogin extends HttpServlet{
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
       try{
    	   dbconn = dataSource.getConnection();
    	   String sql="select COUNT(*) from `user` where `uname` = '" + uname + "' and `upwd`='" + upwd + "'and `root`= '2'";
           PreparedStatement pstmt = dbconn.prepareStatement(sql);
        ResultSet rst = pstmt.executeQuery();
        int count = -1;
		if (rst.next()) {
			count = rst.getInt(1);
		}
		if (count > 0) {
			request.setAttribute("username","欢迎用户"+uname+"!");
			getServletContext().getRequestDispatcher("/addProduct.jsp").forward(request, response);
		} else {
			response.sendRedirect("error.jsp");;
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