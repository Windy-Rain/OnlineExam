package com.exam.service;

import java.util.List;

import com.exam.model.Comment;
import com.exam.vo.CommentConditionVo;

public interface CommentService extends BaseService<Comment> {
	
    List<Comment> selectComments(CommentConditionVo vo);

    int deleteBatch(Integer[]ids);

}
