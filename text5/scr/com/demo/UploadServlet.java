package com.demo;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.model.Product;



@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "upload";
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	DataSource dataSource;

	public void init() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/productDS");
		} catch (NamingException ne) {
			System.out.println(ne);
			getServletContext().log("驱动程序类找不到！");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		if (!ServletFileUpload.isMultipartContent(request)) {
			PrintWriter writer = response.getWriter();
			writer.println("Error:enctype=multipart/form-data is not exist");
			writer.flush();
			return;
		}
		//doGet(request, response);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);
		upload.setHeaderEncoding("UTF-8");
		String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}		
		int id = -1;
		int pnum = -1;
		float price = -1;
		String pname = null;
		String ptype = null;
		String fileName = null;
		String filePath = null;
		try {
			List<FileItem> formItems = upload.parseRequest(request);
			if (formItems != null && formItems.size() > 0) {
				for (FileItem item : formItems) {
					if (item.isFormField()) {
						String itemName = item.getFieldName();
						if (itemName.equals("id")) {
							id = Integer.parseInt(item.getString());
						} else if (itemName.equals("pnum")) {
							pnum = Integer.parseInt(item.getString());
						} else if (itemName.equals("price")) {
							price = Float.parseFloat(item.getString());
						} else if (itemName.equals("ptype")) {
							ptype = item.getString();
						} else if (itemName.equals("pname")) {
							pname = item.getString();
						}
					}else if (!item.isFormField()) {
						fileName = new File(item.getName()).getName();
						filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						System.out.println(filePath);
						item.write(storeFile);
					}
				}
				Connection dbconn = null;
				try {
					dbconn = dataSource.getConnection();
					String sql = "INSERT INTO product(id,pname,price,pnum,ptype,picid) VALUES ('" + id + "',?,'" + price + "','" + pnum + "',?,?)";
					PreparedStatement pstmt = dbconn.prepareStatement(sql);
					pstmt.setString(1, pname);
					pstmt.setString(2, ptype);
					pstmt.setString(3, fileName);
					int rst = pstmt.executeUpdate();

					ServletContext context = getServletContext();
					ArrayList<Product> productList = (ArrayList<Product>) context.getAttribute("productList");
				    productList.add(new Product(id, pname, price, pnum, ptype,fileName));
				    context.setAttribute("productList", productList);
					
					if (rst!=0) {
						request.setAttribute("message","商品"+pname+"上传成功!");
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
			}
		} catch (Exception ex) {
			request.setAttribute("message", "错误信息: " + ex.getMessage());
		}
		getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
	}
}