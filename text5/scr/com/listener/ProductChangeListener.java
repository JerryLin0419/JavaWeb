package com.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;

public class ProductChangeListener implements ServletContextAttributeListener {


    public ProductChangeListener() {
    }


    public void attributeAdded(ServletContextAttributeEvent scae)  { 
    	String conName = scae.getName();
		//Object conValue = scae.getServletContext().getAttribute(conName);
		System.out.println("创建商品列表：" + conName);
    }


    public void attributeRemoved(ServletContextAttributeEvent scae)  { 
    	String conName = scae.getName();
		System.out.println("移除商品列表：" + conName);
    }


    public void attributeReplaced(ServletContextAttributeEvent scae)  { 
    	String conName = scae.getName();
		System.out.println("检测到商品列表" + conName + "更新");
    }
	
}
