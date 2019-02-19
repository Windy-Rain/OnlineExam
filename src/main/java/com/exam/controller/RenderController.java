package com.exam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.exam.service.QuestionService;
import com.exam.service.UserService;


@Controller
public class RenderController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private UserService userService;
	

    /*工作台*/
    @GetMapping("/workdest")
    public String workdest(Model model){
    	int questionNums = questionService.totalNum();
    	int userNums = userService.userNums();
    	model.addAttribute("questionNums", questionNums);
    	model.addAttribute("userNums", userNums);
        return "manager/workdest";
    }

    /**用户列表入口*/
    @GetMapping("/users")
    public String userList(){
        return "user/list";
    }

    /*角色列表入口*/
    @GetMapping("/roles")
    public String roleList() {
        return "role/list";
    }

    /*权限列表入口*/
    @GetMapping("/permissions")
    public String permissionList(){
        return "permission/list";
    }

    /*在线用户入口*/
    @GetMapping("/online/users")
    public String onlineUsers(){return "onlineUsers/list";}
}
