package com.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.service.GradeService;
import com.exam.util.ResultUtil;
import com.exam.vo.StatisticConditionVo;
import com.exam.vo.base.ResponseVo;

@Controller
@RequestMapping("data")
public class StatisticsController {
	
	@Autowired
	private GradeService gradeService;

	
	@PostMapping("list")
	@ResponseBody
	public ResponseVo loadData(Integer examId, String grade, Integer insId, Integer classId, Integer subjectId) {
		StatisticConditionVo vo = new StatisticConditionVo();
		vo.setExamId(examId);
		vo.setGrade(grade);
		vo.setInsId(insId);
		vo.setClassId(classId);
		vo.setSubjectId(subjectId);
		List<Integer> userList = gradeService.getUserNumsAnalysis(vo);
		if(!userList.isEmpty()) {
			return ResultUtil.success("数据更新成功", userList);
		}else {
			return ResultUtil.error("数据获取失败");
		}
	}
}
