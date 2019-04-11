package com.exam.mapper;

import com.exam.model.Classes;
import com.exam.model.Institute;
import com.exam.util.MapperUtil;

public interface InstituteMapper extends MapperUtil<Institute> {

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
