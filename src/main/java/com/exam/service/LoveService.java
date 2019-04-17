package com.exam.service;

import com.exam.model.Love;
import com.exam.vo.LoveConditionVo;

public interface LoveService extends BaseService<Love>{
	
	Love findByCondition(LoveConditionVo vo);

}
