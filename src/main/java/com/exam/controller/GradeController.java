package com.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.model.Grade;
import com.exam.service.ExaminationService;
import com.exam.service.GradeService;
import com.exam.util.PageUtil;
import com.exam.util.ResultUtil;
import com.exam.vo.GradeConditionVo;
import com.exam.vo.base.PageResultVo;
import com.exam.vo.base.ResponseVo;
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
	
	/**
	 * 批阅试卷
	 * @param grade
	 * @return
	 */
	
	@PostMapping("/mark")
	@ResponseBody
	public ResponseVo mark(Grade grade) {
		try {
			Grade obj = gradeService.selectById(grade.getId());
			grade.setResult(obj.getResult()+grade.getManulResult());
			grade.setStatus(1);
			gradeService.updateNotNull(grade);
			return ResultUtil.success("批阅成功");
		} catch (Exception e) {
			return ResultUtil.success("批阅失败");
		}
	}
	
	/**
	 * 查看成绩详情
	 * @param model
	 * @param id
	 * @return
	 */
	
	@GetMapping("/detail")
	public String detail(Model model, Integer id) {
		Grade grade = gradeService.selectById(id);
		model.addAttribute("grade", grade);
		return "grade/detail";
	}
	
	
	/**
	 * 单个删除成绩
	 * @param id
	 * @return
	 */
	@PostMapping("/delete")
	@ResponseBody
	public ResponseVo delete(Integer id) {
		int i = gradeService.deleteBatch(new Integer[] {id});
		if(i > 0) {
			return ResultUtil.success("删除成绩成功");
		}else {
			return ResultUtil.error("删除成绩失败");
		}
	}
	
	/**
	 * 批量删除成绩
	 * @param ids
	 * @return
	 */
	@PostMapping("/batch/delete")
	@ResponseBody
	public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[] ids) {
		int i = gradeService.deleteBatch(ids);
		if(i > 0) {
			return ResultUtil.success("批量删除成绩成功");
		}else {
			return ResultUtil.error("批量删除成绩失败");
		}
	}
	
}
