package com.listener;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class LoginFilter implements Filter {

	public LoginFilter() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("过滤器...创建...");
	}

	public void destroy() {
		System.out.println("过滤器...销毁...");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("登陆发送请求");
		chain.doFilter(request, response);
		System.out.println("登陆返回相应");
	}
}
