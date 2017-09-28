package com.springmvc.entity;

import java.io.Serializable;
import java.util.List;

public class PageBean <T> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7673041600356804086L;
	
	private long total; //总共的数据条数
	
	private List<T> data; //当前页具体数据



	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "PageBean [total=" + total + ", data=" + data + "]";
	}
}
