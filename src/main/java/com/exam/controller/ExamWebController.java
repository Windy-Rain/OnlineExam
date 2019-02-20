package com.exam.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exam.model.Examination;
import com.exam.service.ExaminationService;

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
	public String toExam(Model model) {
		return "index/examination";
	}
	
	@GetMapping("/exam/login")
	public String login(Model model) {
		return "index/login";
	}
	
}
