package com.demo;


import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Product;

public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DownloadServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int BID=Integer.parseInt(request.getParameter("BID"));
		System.out.println("当前商品号："+BID);
		String filename=null;
		ServletContext context = getServletContext();
		ArrayList<Product> products = (ArrayList<Product>) context.getAttribute("productList");
		for (Product product : products) {
			if (product.getId() == BID) {
				filename = product.getPicid();
			}
		}
		System.out.println("当前图片名："+filename);
		response.addHeader("content-Type","application/octet-stream");
		response.addHeader("content-Disposition","attachment;filename="+filename);
		InputStream in = getServletContext().getResourceAsStream("/upload/"+filename);
		ServletOutputStream out = response.getOutputStream();
		byte[] bs = new byte[1024];
		int i = in.read(bs);
        while (i != -1) {
             out.write(bs, 0, i);
             i = in.read(bs);
        }
        out.close();
        in.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
