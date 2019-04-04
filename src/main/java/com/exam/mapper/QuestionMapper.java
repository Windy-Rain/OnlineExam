package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.exam.model.Examination;
import com.exam.model.Question;
import com.exam.util.MapperUtil;
import com.exam.vo.QuestionConditionVo;

public interface QuestionMapper extends MapperUtil<Question> {
	
	/**
	 * 分页查询，关联查询问题类型
	 * @param vo
	 * @return
	 */
	List<Question> findByCondition(QuestionConditionVo vo);
	
	/**
	 * 根据id查询题目
	 * @param id
	 * @return
	 */
	Question selectById(Integer id);
	
	/**
	 * 批量删除问题
	 * @param ids
	 * @return
	 */
	int deleteBatch(Integer[] ids);

	@Select("select count(id) questionNums from question")
	int countNum();
	
	/**
	 * 批量插入问题
	 * @param questionList
	 */
	int batchInsert(List<Question> questionList);

	/**
	 * 验证该课程是否有子数据
	 * @param ids
	 * @return
	 */
	Question validateBySubjectIds(Integer[] ids);
	

}
