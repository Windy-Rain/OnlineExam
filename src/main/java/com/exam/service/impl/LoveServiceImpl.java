package com.exam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.LoveMapper;
import com.exam.model.Love;
import com.exam.service.LoveService;
import com.exam.vo.LoveConditionVo;

@Service
public class LoveServiceImpl extends BaseServiceImpl<Love> implements LoveService {

	@Autowired
	private LoveMapper loveMapper;
	
	@Override
	public Love findByCondition(LoveConditionVo vo) {
		return loveMapper.findByCondition(vo);
	}
	
}
