package com.exam.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.service.GradeService;
import com.exam.service.UserService;
import com.exam.util.ResultUtil;
import com.exam.vo.base.ResponseVo;

@Controller
public class ExamApiController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GradeService gradeService;
	
	
	/**
	 * 学院及格人数统计接口
	 * @return
	 */
	@PostMapping("/api/aps")
	@ResponseBody
	public ResponseVo academyPassNumSta() {
		List<HashMap<String, Object>> list = userService.academyPassNumSta();
		if(!list.isEmpty()) {
			return ResultUtil.success("数据更新成功", list);
		}else {
			return ResultUtil.error("没有数据");
		}
	}

}
