package com.exam.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.exam.model.Examination;
import com.exam.model.User;
import com.exam.service.ExaminationService;
import com.exam.util.PageUtil;
import com.exam.vo.ExaminationConditionVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ExamWebController {
	
	@Autowired
	private ExaminationService examService;
	
	@RequestMapping("/")
	public String index(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "index/index";
		}else {
			return "index/index";
		}
	}
	
	@GetMapping("/exam")
	public String exam(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "redirect:/exam/examination";
		}else {
			return "redirect:/exam/login";
		}
	}	
	
	@GetMapping("/exam/examination")
	public String toExam(Model model, ExaminationConditionVo examConditionVo) {
		PageHelper.startPage(PageUtil.getPageNo(10, 0),10);
		List<Examination> examList = examService.findByCondition(examConditionVo);
		PageInfo<Examination> pages = new PageInfo<>(examList);
		model.addAttribute("pageInfo", pages);
		return "index/examination";
	}
	
	@GetMapping("/exam/login")
	public String login(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "redirect:/";
		}else {
			return "index/login";
		}
	}
	
	@GetMapping("/exam/startexam")
	public String startToExam(Model model, Integer id) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		List<Examination> listExam = examService.queryByExamId(id);
		model.addAttribute("examination", listExam);
		model.addAttribute("user", user);
		return "index/detail";
	}
	
}
