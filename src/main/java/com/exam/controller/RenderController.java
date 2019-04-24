package com.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.exam.model.Classes;
import com.exam.model.Institute;
import com.exam.service.ClassesService;
import com.exam.service.CommentService;
import com.exam.service.ExaminationService;
import com.exam.service.InstituteService;
import com.exam.service.QuestionService;
import com.exam.service.SubjectService;
import com.exam.service.UserService;
import com.exam.util.CoreConst;


@Controller
public class RenderController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private InstituteService instituteService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ClassesService classesService;
	
	@Autowired
	private ExaminationService examService;
	

    /*工作台*/
    @GetMapping("/workdest")
    public String workdest(Model model){
    	examService.updateExamToStart();
		examService.updateExamToEnd();
    	int questionNums = questionService.totalNum();
    	int userNums = userService.userNums();
    	int subjectNums = subjectService.totalNum();
    	int commentNums = commentService.totalNum(CoreConst.STATUS_INVALID);
    	model.addAttribute("questionNums", questionNums);
    	model.addAttribute("userNums", userNums);
    	model.addAttribute("subjectNums", subjectNums);
    	model.addAttribute("commentNums", commentNums);
        return "manager/workdest";
    }

    /**用户列表入口*/
    @GetMapping("/users")
    public String userList(Model model){
    	List<Institute> institutes = instituteService.selectAll();
    	List<Classes> classes = classesService.selectAll();
    	List<String> grades = userService.selectGradeList();
    	model.addAttribute("institutes",institutes);
    	model.addAttribute("classes", classes);
    	model.addAttribute("grades", grades);
        return "user/list";
    }

    /*角色列表入口*/
    @GetMapping("/roles")
    public String roleList() {
        return "role/list";
    }
    
    /*学院管理入口*/
    @GetMapping("/institutes")
    public String instituteList() {
    	return "institute/list";
    }
    
    /*班级管理入口*/
    @GetMapping("/classes")
    public String classesList(Model model) {
    	List<Institute> institutes = instituteService.selectAll();
    	model.addAttribute("institutes",institutes);
    	return "classes/list";
    }

    /*权限列表入口*/
    @GetMapping("/permissions")
    public String permissionList(){
        return "permission/list";
    }

    /*在线用户入口*/
    @GetMapping("/online/users")
    public String onlineUsers(){
    	return "onlineUsers/list";
    }
}
