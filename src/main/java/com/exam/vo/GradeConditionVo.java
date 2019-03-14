package com.exam.vo;

import com.exam.vo.base.BaseConditionVo;

public class GradeConditionVo extends BaseConditionVo {
	
	private String keywords;
	
	private Integer userId;
	
	private Integer status;

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
