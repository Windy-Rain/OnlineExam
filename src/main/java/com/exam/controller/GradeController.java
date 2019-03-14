package com.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.model.Grade;
import com.exam.service.ExaminationService;
import com.exam.service.GradeService;
import com.exam.util.PageUtil;
import com.exam.util.ResultUtil;
import com.exam.vo.GradeConditionVo;
import com.exam.vo.base.PageResultVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("grade")
public class GradeController {
	
	@Autowired
	private GradeService gradeService;
	@Autowired
	private ExaminationService examService;
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadGrade(GradeConditionVo gradeConditionVo, Integer limit, Integer offset) {
		PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
		List<Grade> gradeList = gradeService.findByCondition(gradeConditionVo);
		PageInfo<Grade> pages = new PageInfo<>(gradeList);
		return ResultUtil.table(gradeList, pages.getTotal(), pages);
	}
	
}
