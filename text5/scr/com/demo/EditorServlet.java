package com.demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.model.Product;


@WebServlet(name = "/EditorServlet", urlPatterns = {"/checkProduct","/changeProduct", "/deleteProduct"})
public class EditorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataSource dataSource;
	ServletContext context;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
      String uri = request.getRequestURI();    
      if (uri.endsWith("/changeProduct")) {
          changeProduct(request, response);
      } else if (uri.endsWith("deleteProduct")) {
          try {
			deleteProduct(request, response);
		} catch (NamingException e) {
			e.printStackTrace();
		}
      }
  }

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int BD = Integer.parseInt(request.getParameter("BD"));
		Product product = getProduct(BD);
		if (product != null) {
			HttpSession session = request.getSession();
			session.setAttribute("product2", product);
			response.sendRedirect("editProduct.jsp");
		} else {
			// out.println("No product found");
		}
	}

	private Product getProduct(int productId) {
		context = getServletContext();
		ArrayList<Product> products = (ArrayList<Product>) context.getAttribute("productList");
		for (Product product : products) {
			if (product.getId() == productId) {
				return product;
			}
		}
		return null;
	}

	private void changeProduct(HttpServletRequest request,
            HttpServletResponse response) throws IOException,ServletException {
      int productId = 0;
      try {
          productId = Integer.parseInt(request.getParameter("BID"));
      } catch (NumberFormatException e) {
    	      System.out.println(productId);
      }
      // 根据商品号返回商品对象
      Product product = getProduct(productId);
      if (product != null) {
    	     HttpSession session = request.getSession();
    	     session.setAttribute("product2", product);
    	     response.sendRedirect("editProduct.jsp");
      }else {
          //out.println("No product found");
      }
    }
	
	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, NamingException {
		context = getServletContext();
		Context con = new InitialContext();
	    dataSource = (DataSource)con.lookup("java:comp/env/jdbc/productDS");  
	    Connection dbconn = null;
	    
		int num = 0;
		int productId = Integer.parseInt(request.getParameter("BID"));
		ArrayList<Product> productList = (ArrayList<Product>) context.getAttribute("productList");
		//int productId = Integer.parseInt(request.getParameter("BD"));
		for (Product product : productList) {
   	        if(product == getProduct(productId)){
   		        break;
   	        }else {
   	    	    num=num+1;
   	        }
        }
		productList.remove(num);
		try{
	    	   dbconn = dataSource.getConnection();
	    	   String sql="DELETE FROM `product` WHERE `id`="+productId+"";
	           Statement stmt = dbconn.prepareStatement(sql);    
	           int rst = stmt.executeUpdate(sql);
	           if(rst!=0) {
		           System.out.println("商品已删除");
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
	    context.setAttribute("productList", productList);
	    response.sendRedirect("addProduct.jsp");
	}
}
