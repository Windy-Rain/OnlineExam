package com.exam.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.service.QuestionService;
import com.exam.service.SiteInfoService;
import com.exam.service.SubjectService;
import com.exam.service.UserService;

@Service
public class SiteInfoServiceImpl implements SiteInfoService {
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SubjectService subjectService;

    @Override
    public Map<String, Object> getSiteInfo() {
    	int questionNums = questionService.totalNum();
    	int userNums = userService.userNums();
    	int subjectNums = subjectService.totalNum();
    	Map<String,Object> map = new HashMap<String,Object>();
    	map.put("questionNums", questionNums);
    	map.put("userNums", userNums);
    	map.put("subjectNums", subjectNums);
        return map;
    }

}
