package com.exam.mapper;

import java.util.List;

import com.exam.model.Grade;
import com.exam.util.MapperUtil;
import com.exam.vo.GradeConditionVo;

public interface GradeMapper extends MapperUtil<Grade> {
	
	/**
	 * 分页查询，关联查询
	 * @param vo
	 * @return
	 */

	List<Grade> findByCondition(GradeConditionVo vo);

	Grade selectById(Integer id);

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteBatch(Integer[] ids);

}
