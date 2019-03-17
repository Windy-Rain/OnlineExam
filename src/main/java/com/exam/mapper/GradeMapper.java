package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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

	/**
	 * 验证该用户是否已经参加过考试
	 * @param id
	 * @param userId
	 * @return
	 */
	@Select("select g.* from grade g where g.exam_id=#{id} and user_id=#{userId}")
	Grade validateExam(@Param("id") Integer id, @Param("userId") String userId);

}
