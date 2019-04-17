package com.exam.model;

import com.exam.vo.base.BaseVo;

public class Love extends BaseVo{
	
	private Integer supId;
	
	private Integer loveType;
	
	private String userId;
	
	private String userIp;

	public Integer getSupId() {
		return supId;
	}

	public void setSupId(Integer supId) {
		this.supId = supId;
	}

	public Integer getLoveType() {
		return loveType;
	}

	public void setLoveType(Integer loveType) {
		this.loveType = loveType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

}
