package com.mytag;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTag;


public class TimeTag implements SimpleTag {
	JspContext jspContext = null;
	JspTag parent = null;

	public void doTag() throws JspException, IOException {
		JspWriter out = jspContext.getOut();
		LocalDateTime localDateTime2 = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm:ss");
		//System.out.println("格式化之后的时间: " + localDateTime2.format(formatter));
		out.print("<span style=\"color:blue\">现在时间：</span>" + localDateTime2.format(formatter));
	}

	public JspTag getParent() {
		return parent;
	}

	public void setJspBody(JspFragment jspBody) {     
	}

	public void setJspContext(JspContext jspContext) {
		this.jspContext= jspContext;
	}

	public void setParent(JspTag parent) {
		this.parent= parent;
	}

}
