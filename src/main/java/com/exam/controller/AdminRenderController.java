package com.exam.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.exam.model.BizCategory;
import com.exam.model.Subject;
import com.exam.service.BizCategoryService;
import com.exam.service.SubjectService;
import com.exam.service.SysConfigService;
import com.exam.util.CoreConst;


@Controller
public class AdminRenderController {
    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private SubjectService subjectService;
    /*网站基本信息*/
    @GetMapping("/siteinfo")
    public String siteinfo(Model model){
        Map<String, String> map = sysConfigService.selectAll();
        model.addAttribute("siteinfo", map);
        return "site/siteinfo";
    }
    /*友情链接*/
    @GetMapping("/links")
    public String links(){
        return "link/list";
    }
    /*课程*/
    @GetMapping("/subjects")
    public String subjects() {
    	return "subject/list";
    }
    /*标签*/
    @GetMapping("/tags")
    public String tags(){
        return "tag/list";
    }
    

    /*考试*/
    @GetMapping("/exams")
    public String exams(Model model) {
    	Subject subject = new Subject();
    	subject.setStatus(CoreConst.STATUS_VALID);
    	List<Subject> subjects = subjectService.select(subject);
    	model.addAttribute("subjects", subjects);
    	return "exam/list";
    }
    
    /*题目*/
    @GetMapping("/questions")
    public String questions(Model model) {
    	Subject subject = new Subject();
    	subject.setStatus(CoreConst.STATUS_VALID);
    	List<Subject> subjects = subjectService.select(subject);
    	model.addAttribute("subjects", subjects);
    	return "question/list";
    }
    /*评论*/
    @GetMapping("/comments")
    public String comments(){
        return "comment/list";
    }

}
