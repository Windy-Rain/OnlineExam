package com.exam.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.exam.model.Classes;
import com.exam.model.Institute;
import com.exam.model.Subject;
import com.exam.service.ClassesService;
import com.exam.service.GradeService;
import com.exam.service.InstituteService;
import com.exam.service.SubjectService;
import com.exam.service.SysConfigService;
import com.exam.service.UserService;
import com.exam.util.CoreConst;


@Controller
public class AdminRenderController {
    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private InstituteService instituteService;
    @Autowired
    private ClassesService classesService;
    @Autowired
    private UserService userService;
    
    
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
    	List<Institute> institutes = instituteService.selectAll();
    	List<Classes> classes = classesService.selectAll();
    	List<String> grades = userService.selectGradeList();
    	model.addAttribute("subjects", subjects);
    	model.addAttribute("institutes", institutes);
    	model.addAttribute("classes", classes);
    	model.addAttribute("grades", grades);
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
    
    /*成绩*/
    @GetMapping("/grades")
    public String Grade(Model model) {
    	List<String> grades = userService.selectGradeList();
    	List<Institute> institutes = instituteService.selectAll();
    	List<Classes> classes = classesService.selectAll();
    	List<Subject> subjects = subjectService.selectAll();
    	model.addAttribute("grades", grades);
    	model.addAttribute("institutes", institutes);
    	model.addAttribute("classes", classes);
    	model.addAttribute("subjects", subjects);
    	return "grade/list";
    }
    
    /*评论*/
    @GetMapping("/comments")
    public String comments(){
        return "comment/list";
    }

}
