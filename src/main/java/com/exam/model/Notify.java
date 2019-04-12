package com.exam.model;

import com.exam.vo.base.BaseVo;

public class Notify extends BaseVo {
	
	private String content;
	private String author;
	private Integer status;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

}
