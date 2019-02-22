package com.exam.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.exam.model.ExamQuestion;
import com.exam.model.Examination;
import com.exam.model.Question;
import com.exam.model.Subject;
import com.exam.model.User;
import com.exam.service.ExamQuestionService;
import com.exam.service.ExaminationService;
import com.exam.service.QuestionService;
import com.exam.service.SubjectService;
import com.exam.util.CoreConst;
import com.exam.util.PageUtil;
import com.exam.util.ResultUtil;
import com.exam.vo.ExaminationConditionVo;
import com.exam.vo.base.PageResultVo;
import com.exam.vo.base.ResponseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("exam")
public class ExaminationController {
	
	@Autowired
	private ExaminationService examService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private ExamQuestionService examQuestionService;

	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadExam(ExaminationConditionVo examConditionVo,Integer limit, Integer offset) {
		examService.updateExamToStart();
		examService.updateExamToEnd();
		PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
		List<Examination> examList = examService.findByCondition(examConditionVo);
		PageInfo<Examination> pages = new PageInfo<>(examList);
		return ResultUtil.table(examList, pages.getTotal(), pages);
	}
	
	@GetMapping("/add")
	public String addExam(Model model) {
		Subject subject = new Subject();
		subject.setStatus(CoreConst.STATUS_VALID);
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute("subjects", JSON.toJSONString(subjects));
		return "exam/publish";
	}
	
	
	@PostMapping("/add")
	@ResponseBody
	public ResponseVo add(Examination examination , Integer[]question) {
		try {
			User user = (User)SecurityUtils.getSubject().getPrincipal();
			examination.setUserId(user.getUserId());
			examination.setAuthor(user.getNickname());
			Examination exam = examService.insertExam(examination);
			examQuestionService.insertList(exam.getId(),question);
			return ResultUtil.success("发布考试成功");
		} catch (Exception e) {
			return ResultUtil.error("发布考试失败");
		}
	}
	
	@GetMapping("/edit")
	public String edit(Model model, Integer id) {
		Examination examination = examService.selectById(id);
		model.addAttribute("examination", examination);
		Subject subject = new Subject();
		subject.setStatus(CoreConst.STATUS_VALID);
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute("subjects", JSON.toJSONString(subjects));
		List<ExamQuestion> examQuestions = examQuestionService.selectByExamId(id);
		List<Integer> questionIds = new ArrayList<>();
		for(ExamQuestion examQuestion : examQuestions) {
			questionIds.add(examQuestion.getQuestionId());
		}
		model.addAttribute("questionIds", questionIds);
		return "exam/detail";
	}
	
	@PostMapping("/edit")
	@ResponseBody
	public ResponseVo edit(Examination examination, Integer[]question) {
		examService.updateNotNull(examination);
		examQuestionService.removeByExamId(examination.getId());
		examQuestionService.insertList(examination.getId(),question);
		return ResultUtil.success("编辑考试成功");
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public ResponseVo delete(Integer id) {
		int i = examService.deleteBatch(new Integer[] {id});
		int j = examQuestionService.deleteBatch(new Integer[] {id});
		if(i > 0 && j > 0) {
			return ResultUtil.success("删除考试成功");
		}else {
			return ResultUtil.error("删除考试失败");
		}
	}
	
	@PostMapping("/batch/delete")
	@ResponseBody
	public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[] ids) {
		int i = examService.deleteBatch(ids);
		int j = examQuestionService.deleteBatch(ids);
		if(i > 0 && j > 0) {
			return ResultUtil.success("批量删除成功");
		}else {
			return ResultUtil.error("批量删除失败");
		}
	}
	
}