package com.exam.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.model.Classes;
import com.exam.model.User;
import com.exam.service.ClassesService;
import com.exam.util.CoreConst;
import com.exam.util.PageUtil;
import com.exam.util.ResultUtil;
import com.exam.vo.ClassesConditionVo;
import com.exam.vo.base.PageResultVo;
import com.exam.vo.base.ResponseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("classes")
public class ClassesController {
	
	@Autowired
	private ClassesService classesService;
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadClasses(ClassesConditionVo classesConditionVo, Integer limit, Integer offset) {
		PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
		List<Classes> classesList = classesService.findByCondition(classesConditionVo);
		PageInfo<Classes> pages = new PageInfo<>(classesList);
		return ResultUtil.table(classesList, pages.getTotal(), pages);
	}
	
	/**
	 * 新增班级
	 * @param classes
	 * @return
	 */
	@PostMapping("/add")
	@ResponseBody
	public ResponseVo add(Classes classes) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		classes.setAuthor(user.getNickname());
		Date date = new Date();
		classes.setCreateTime(date);
		classes.setUpdateTime(date);
		classes.setStatus(CoreConst.STATUS_VALID);
		
		int i = classesService.insert(classes);
		if(i > 0) {
			return ResultUtil.success("新增班级信息成功");
		}else {
			return ResultUtil.error("新增班级信息失败");
		}
	}

	/**
	 * 更新班级信息
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/edit")
	public String edit(Model model,Integer id) {
		Classes classes = classesService.selectById(id);
		model.addAttribute("classes", classes);
		return "classes/detail";
	}
	
	@PostMapping("/edit")
	@ResponseBody
	public ResponseVo edit(Classes classes) {
		int i = classesService.updateNotNull(classes);
		if(i > 0) {
			return ResultUtil.success("更新班级信息成功");
		}else {
			return ResultUtil.error("更新班级信息失败");
		}
	}
	
	/**
	 * 删除班级信息
	 * @param id
	 * @return
	 */
	@PostMapping("/delete")
	@ResponseBody
	public ResponseVo delete(Integer id) {
		//验证班级下是否有学生
		int i = classesService.validateByClassIds(new Integer[] {id});
		if(i > 0) {
			return ResultUtil.error("无法删除，该班级中还有学生");
		}else {
			int j = classesService.deleteBatch(new Integer[] {id});
			if(j > 0) {
				return ResultUtil.success("删除班级信息成功");
			}else {
				return ResultUtil.error("删除班级信息 失败");
			}
		}
	}
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	@PostMapping("/batch/delete")
	@ResponseBody
	public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[]ids) {
		//验证该班级中是否有学生
		int i = classesService.validateByClassIds(ids);
		if(i > 0) {
			return ResultUtil.error("无法批量删除，该班级中还有学生");
		}else {
			int j = classesService.deleteBatch(ids);
			if(j > 0) {
				return ResultUtil.success("批量删除班级信息成功");
			}else {
				return ResultUtil.error("批量删除班级信息失败");
			}
		}
	}
	
	
}
