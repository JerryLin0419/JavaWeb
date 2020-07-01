package com.model;

import java.io.Serializable;

public class Product implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id; // 商品编号
	private String pname; // 商品名称
	private double price; // 商品价格
	private int pnum; // 商品库存量
	private String ptype; // 商品类别
	private String picid; // 商品图片
	// 构造方法

	public Product() {
	}

	public Product(int id, String pname, double price, int pnum, String ptype, String picid) {
		this.id = id;
		this.pname = pname;
		this.price = price;
		this.pnum = pnum;
		this.ptype = ptype;
		this.picid = picid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPicid() {
		return picid;
	}

	public void setPicid(String picid) {
		this.picid = picid;
	}

}
