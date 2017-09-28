package com.springmvc.entity;

import java.io.Serializable;

public class PageParam implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5609419383593305510L;
	private static final int default_rows = 10;
	private static final int default_pageNumber = 1;
	private int pageNumber; //页号
	
	private int pageSize; //每页的列数
	
	private String sort;//根据什么排序
	private String order;//升序还是降序
	
	
	//
	private long beginPageIndex;
	private long endPageIndex;

	public PageParam(){
	//	this.pageSize = default_rows;
	//	this.pageNumber = default_pageNumber;
	}
	public int getPageNumber() {
		return this.pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public long getBeginPageIndex() {
		if(pageNumber == 1){
			beginPageIndex=0;
		}else{
			beginPageIndex=(pageNumber-1)*pageSize;
		}
		
		return beginPageIndex;
	}
	public long getEndPageIndex(){
		return getBeginPageIndex()+pageSize;
	}
	@Override
	public String toString() {
		return "PageParam [pageNumber=" + pageNumber + ", pageSize=" + pageSize + ", sort=" + sort + ", order=" + order
				+ ", beginPageIndex=" + beginPageIndex + ", endPageIndex=" + endPageIndex + "]";
	}
	
	
	
}
