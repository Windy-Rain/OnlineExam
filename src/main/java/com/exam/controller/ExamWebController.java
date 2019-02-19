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
		model.addAttribute("category", "index");
		return "index/index";
	}
	
	@GetMapping("/toExam")
	public String exam(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			model.addAttribute("category", "examination");
			return "index/examination";
		}else {
			return "index/login";
		}
	}	
	
}
