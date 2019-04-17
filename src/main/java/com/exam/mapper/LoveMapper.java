package com.exam.mapper;

import com.exam.model.Love;
import com.exam.util.MapperUtil;
import com.exam.vo.LoveConditionVo;

public interface LoveMapper extends MapperUtil<Love> {
	
	Love findByCondition(LoveConditionVo vo);

}
