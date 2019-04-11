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
import com.exam.model.Institute;
import com.exam.model.User;
import com.exam.service.InstituteService;
import com.exam.util.CoreConst;
import com.exam.util.PageUtil;
import com.exam.util.ResultUtil;
import com.exam.vo.base.PageResultVo;
import com.exam.vo.base.ResponseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("institute")
public class InstituteController {
	
	@Autowired
	private InstituteService instituteService;
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadInstitute(Integer limit, Integer offset) {
		PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
		List<Institute> instituteList = instituteService.selectAll();
		PageInfo<Institute> pages = new PageInfo<>(instituteList);
		return ResultUtil.table(instituteList, pages.getTotal(), pages);
	}
	
	/**
	 * 新增学院
	 * @param institute
	 * @return
	 */
	@PostMapping("/add")
	@ResponseBody
	public ResponseVo add(Institute institute) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		institute.setAuthor(user.getNickname());
		Date date = new Date();
		institute.setCreateTime(date);
		institute.setUpdateTime(date);
		institute.setStatus(CoreConst.STATUS_VALID);
		int i = instituteService.insert(institute);
		if(i > 0) {
			return ResultUtil.success("新增学院成功");
		}else {
			return ResultUtil.error("新增学院失败");
		}
	}
	
	/**
	 * 编辑学院信息
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/edit")
	public String edit(Model model, Integer id) {
		Institute institute = instituteService.selectById(id);
		model.addAttribute("institute", institute);
		return "institute/detail";
	}
	
	@PostMapping("/edit")
	@ResponseBody
	public ResponseVo edit(Institute institute) {
		int i = instituteService.updateNotNull(institute);
		if(i > 0) {
			return ResultUtil.success("更新学院信息成功");
		}else {
			return ResultUtil.error("更新学院信息失败");
		}
	}
	
	/**
	 * 删除学院信息
	 * @param id
	 * @return
	 */
	@PostMapping("/delete")
	@ResponseBody
	public ResponseVo delete(Integer id) {
		//验证该学院是否存在班级
		Classes classes = instituteService.validateByInsIds(new Integer[] {id});
		if(classes.getCounts() > 0) {
			return ResultUtil.error("无法删除，该学院下存在班级");
		}else {
			int i = instituteService.deleteBatch(new Integer[] {id});
			if(i > 0) {
				return ResultUtil.success("删除学院信息成功");
			}else {
				return ResultUtil.error("删除学院信息失败");
			}
		}
	}
	
	@PostMapping("/batch/delete")
	@ResponseBody
	public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[]ids) {
		//验证该学院下是否存在班级
		Classes classes = instituteService.validateByInsIds(ids);
		if(classes.getCounts() > 0) {
			return ResultUtil.error("无法批量删除，该学院下存在班级");
		}else {
			int i = instituteService.deleteBatch(ids);
			if(i > 0) {
				return ResultUtil.success("批量删除学院信息成功");
			}else {
				return ResultUtil.error("批量删除学院信息失败");
			}
		}
	}

}
