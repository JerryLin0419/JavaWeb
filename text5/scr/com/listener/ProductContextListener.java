package com.listener;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import java.sql.*;
import com.model.Product;
import java.util.ArrayList;

@WebListener // 使用注解注册监听器
public class ProductContextListener implements ServletContextListener {
	private ServletContext context = null;
	DataSource dataSource;
	Connection dbconn = null;
	public void contextInitialized(ServletContextEvent sce) {
		ArrayList<Product> productList = new ArrayList<Product>();
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/productDS");
			dbconn = dataSource.getConnection();
		} catch (NamingException ne) {
			System.out.println(ne);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			String sql = "SELECT * FROM product";
			PreparedStatement pstmt = dbconn.prepareStatement(sql);
			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				Product product = new Product();
				product.setId(result.getInt("id"));
				product.setPname(result.getString("pname"));
				product.setPnum(result.getInt("pnum"));
				product.setPrice(result.getFloat("price"));
				product.setPtype(result.getString("ptype"));
				product.setPicid(result.getString("picid"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				dbconn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}		
		}
		productList.add(new Product(306, "Eternal Card Game", 6, 12000, "休闲","16.png"));
		productList.add(new Product(307, "They Are Billions", 95, 1200, "策略","17.png"));
		productList.add(new Product(308, "Red Dead Redemption", 249, 300, "冒险","18.png"));
		productList.add(new Product(309, "The Witcher 3", 127, 300, "冒险","19.png"));
		context = sce.getServletContext();
		// 将productList存储在应用作用域中
		context.setAttribute("productList", productList); // 添加属性
	}

	public void contextDestroyed(ServletContextEvent sce) {
		context = sce.getServletContext();
		context.removeAttribute("productList");
	}
}
