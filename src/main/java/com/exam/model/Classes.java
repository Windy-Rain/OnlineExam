package com.exam.model;

import java.util.List;

import javax.persistence.Transient;

import com.exam.vo.base.BaseVo;

public class Classes extends BaseVo {
	
	private Integer insId;
	private String className;
	private String description;
	private Integer sort;
	private String author;
	private Integer status;
	@Transient
	private Integer counts;
	
	@Transient
	private Institute institute;
	@Transient
	private List<User> listUser;

	
	public Integer getInsId() {
		return insId;
	}

	public void setInsId(Integer insId) {
		this.insId = insId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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
	
	public Integer getCounts() {
		return counts;
	}

	public void setCounts(Integer counts) {
		this.counts = counts;
	}

	public Institute getInstitute() {
		return institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

	public List<User> getListUser() {
		return listUser;
	}

	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}

}
