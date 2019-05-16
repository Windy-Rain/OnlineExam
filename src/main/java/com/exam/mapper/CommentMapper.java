package com.exam.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.exam.model.Comment;
import com.exam.util.MapperUtil;
import com.exam.vo.CommentConditionVo;

public interface CommentMapper extends MapperUtil<Comment> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<Comment> selectComments(CommentConditionVo vo);

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    int deleteBatch(Integer[] ids);
    
    List<HashMap<String, Object>> noReadMessage();

    @Select("select count(id) nums FROM comment WHERE status = #{status}")
	int totalNum(Integer status);
}
