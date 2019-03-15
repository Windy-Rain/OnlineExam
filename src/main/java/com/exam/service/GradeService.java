package com.exam.service;

import java.util.List;

import com.exam.model.Grade;
import com.exam.vo.GradeConditionVo;

public interface GradeService extends BaseService<Grade> {
	
	/**
	 * 分页查询
	 * @param vo
	 * @return
	 */
	List<Grade> findByCondition(GradeConditionVo vo);
	
	/**
	 * 记录考试成绩
	 * @param grade
	 * @return
	 */
	
	Grade insertGrade(Grade grade);

	Grade selectById(Integer id);


}
