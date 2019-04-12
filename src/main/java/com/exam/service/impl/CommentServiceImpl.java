package com.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.CommentMapper;
import com.exam.model.Comment;
import com.exam.service.CommentService;
import com.exam.vo.CommentConditionVo;

@Service
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService {
	
    @Autowired
    private CommentMapper commentMapper;
    
    @Override
    public List<Comment> selectComments(CommentConditionVo vo) {
        return commentMapper.selectComments(vo);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return commentMapper.deleteBatch(ids);
    }

	@Override
	public int totalNum(Integer status) {
		return commentMapper.totalNum(status);
	}
}
