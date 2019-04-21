package com.exam.model;

import javax.persistence.Transient;

import com.exam.vo.base.BaseVo;

public class Grade extends BaseVo {
	
	private String userId;
	private Integer examId;
	private Integer result;
	private Integer autoResult;
	private Integer manulResult;
	private String autoJson;
	private String manulJson;
	private String answerJson;
	private Integer status;
	
	@Transient
	private User user;
	
	@Transient
	private Institute institute;
	@Transient
	private Classes classes;
	@Transient
	private Subject subject;
	
	@Transient
	private Examination examination;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public Integer getAutoResult() {
		return autoResult;
	}
	public void setAutoResult(Integer autoResult) {
		this.autoResult = autoResult;
	}
	public Integer getManulResult() {
		return manulResult;
	}
	public void setManulResult(Integer manulResult) {
		this.manulResult = manulResult;
	}
	public String getAnswerJson() {
		return answerJson;
	}
	public void setAnswerJson(String answerJson) {
		this.answerJson = answerJson;
	}
	public String getAutoJson() {
		return autoJson;
	}
	public void setAutoJson(String autoJson) {
		this.autoJson = autoJson;
	}
	public String getManulJson() {
		return manulJson;
	}
	public void setManulJson(String manulJson) {
		this.manulJson = manulJson;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Institute getInstitute() {
		return institute;
	}
	public void setInstitute(Institute institute) {
		this.institute = institute;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public Examination getExamination() {
		return examination;
	}
	public void setExamination(Examination examination) {
		this.examination = examination;
	}
}
