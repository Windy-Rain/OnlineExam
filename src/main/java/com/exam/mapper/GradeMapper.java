package com.exam.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.exam.model.Grade;
import com.exam.util.MapperUtil;
import com.exam.vo.GradeConditionVo;
import com.exam.vo.StatisticConditionVo;

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
	
	/**
	 * 参加考试的总人数
	 * @return
	 */
	List<HashMap<String, Object>> totalUserNums(StatisticConditionVo vo);
	
	/**
	 * 及格人数
	 * @return
	 */
	List<HashMap<String, Object>> passUserNums(StatisticConditionVo vo);
	
	/**
	 * 不及格人数
	 * @return
	 */
	List<HashMap<String, Object>> noPassUserNums(StatisticConditionVo vo);
	
	/**
	 * 成绩良好人数
	 * @return
	 */
	List<HashMap<String, Object>> goodUserNums(StatisticConditionVo vo);
	
	/**
	 * 成绩优秀人数
	 * @return
	 */
	List<HashMap<String, Object>> fineUserNums(StatisticConditionVo vo);

}
