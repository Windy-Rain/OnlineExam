package com.exam.model;

import java.util.List;

import javax.persistence.Transient;

import com.exam.vo.base.BaseVo;

public class Institute extends BaseVo {
	
	private String instituteName;
	private String description;
	private String instituteLogo;
	private Integer sort;
	private String author;
	private Integer status;
	
	@Transient
	private List<Classes> listClass;

	@Transient
	private List<User> listUser;
	
	public String getInstituteName() {
		return instituteName;
	}

	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getInstituteLogo() {
		return instituteLogo;
	}

	public void setInstituteLogo(String instituteLogo) {
		this.instituteLogo = instituteLogo;
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

	public List<Classes> getListClass() {
		return listClass;
	}

	public void setListClass(List<Classes> listClass) {
		this.listClass = listClass;
	}

	public List<User> getListUser() {
		return listUser;
	}

	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}
}
