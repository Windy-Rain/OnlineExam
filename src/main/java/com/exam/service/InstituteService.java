package com.exam.service;

import java.util.List;

import com.exam.model.Classes;
import com.exam.model.Institute;

public interface InstituteService extends BaseService<Institute> {
	
	/**
	 * 查询所有学院
	 * @param institute
	 * @return
	 */
	List<Institute> selectInstitutes(Institute institute);

	/**
	 * 根据id查询学院信息
	 * @param id
	 * @return
	 */
	Institute selectById(Integer id);

	/**
	 * 验证该学院下是否存在班级
	 * @param ids
	 * @return
	 */
	Classes validateByInsIds(Integer[] ids);

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteBatch(Integer[] ids);


}
