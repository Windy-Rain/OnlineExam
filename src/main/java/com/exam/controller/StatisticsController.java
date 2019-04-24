package com.exam.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.service.GradeService;
import com.exam.util.PageUtil;
import com.exam.util.ResultUtil;
import com.exam.vo.StatisticConditionVo;
import com.exam.vo.base.PageResultVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("data")
public class StatisticsController {
	
	@Autowired
	private GradeService gradeService;

	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadData(StatisticConditionVo vo, Integer limit, Integer offset) {
		PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
		List<HashMap<String, Object>> list = gradeService.examUserNumsAnalysis(vo);
		/*for(int i = 0; i < list.size(); i++) {
			Integer passNums = (Integer) list.get(i).get("passNums");
		}*/
		PageInfo<HashMap<String, Object>> pages = new PageInfo<>(list);
		return ResultUtil.table(list, pages.getTotal(), pages);
	}
}
