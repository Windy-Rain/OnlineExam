package com.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.InstituteMapper;
import com.exam.model.Classes;
import com.exam.model.Institute;
import com.exam.service.InstituteService;

@Service
public class InstituteServiceImpl extends BaseServiceImpl<Institute> implements InstituteService {

	@Autowired
	private InstituteMapper instituteMapper;
	
	@Override
	public List<Institute> selectInstitutes(Institute institute) {
		return instituteMapper.selectInstitutes(institute);
	}
	
	@Override
	public Institute selectById(Integer id) {
		return instituteMapper.selectById(id);
	}

	@Override
	public Classes validateByInsIds(Integer[] ids) {
		return instituteMapper.validateByInsIds(ids);
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return instituteMapper.deleteBatch(ids);
	}


}
