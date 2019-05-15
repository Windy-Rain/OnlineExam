package com.exam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/error")
public class ErrorController {
	
    /*shiro无权限时进入*/
    @RequestMapping("/403")
    public String noPermission(HttpServletRequest request, HttpServletResponse response,Model model){
        response.setStatus(HttpStatus.FORBIDDEN.value());
        return "error/403";
    }
    @RequestMapping("/404")
    public String notFund(HttpServletRequest request, HttpServletResponse response,Model model){
        return "error/404";
    }

    @RequestMapping("/500")
    public String sysError(HttpServletRequest request, HttpServletResponse response,Model model){
        return "error/500";
    }

}
