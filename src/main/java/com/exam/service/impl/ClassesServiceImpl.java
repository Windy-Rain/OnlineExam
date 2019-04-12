package com.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.ClassesMapper;
import com.exam.model.Classes;
import com.exam.service.ClassesService;
import com.exam.vo.ClassesConditionVo;

@Service
public class ClassesServiceImpl extends BaseServiceImpl<Classes> implements ClassesService {
	
	@Autowired
	private ClassesMapper classesMapper;
	
	@Override
	public List<Classes> findByCondition(ClassesConditionVo vo) {
		return classesMapper.findByCondition(vo);
	}

	@Override
	public Classes selectById(Integer id) {
		return classesMapper.selectById(id);
	}

	@Override
	public int validateByClassIds(Integer[] ids) {
		return classesMapper.validateByClassIds(ids);
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return classesMapper.deleteBatch(ids);
	}

}
