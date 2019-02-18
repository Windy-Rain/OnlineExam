package com.exam.vo;

import java.util.List;

import com.exam.vo.base.BaseConditionVo;

public class ExaminationConditionVo extends BaseConditionVo {
	
	private String keywords;
	
	private Integer subjectId;
	
	private Integer status;
	
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
