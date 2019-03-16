package com.exam.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.GradeMapper;
import com.exam.model.Grade;
import com.exam.service.GradeService;
import com.exam.vo.GradeConditionVo;

@Service
public class GradeServiceImpl extends BaseServiceImpl<Grade> implements GradeService {
	
	@Autowired
	private GradeMapper gradeMpper;
	
	@Override
	public List<Grade> findByCondition(GradeConditionVo vo) {
		List<Grade> list = gradeMpper.findByCondition(vo);
		return list;
	}

	@Override
	public Grade insertGrade(Grade grade) {
		Date date = new Date();
		grade.setCreateTime(date);
		grade.setUpdateTime(date);
		gradeMpper.insertSelective(grade);
		return grade;
	}

	@Override
	public Grade selectById(Integer id) {
		return gradeMpper.selectById(id);
		
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return gradeMpper.deleteBatch(ids);
	}

}
