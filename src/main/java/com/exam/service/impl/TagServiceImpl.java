package com.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.TagMapper;
import com.exam.model.Tag;
import com.exam.service.TagService;

@Service
public class TagServiceImpl extends BaseServiceImpl<Tag> implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    public List<Tag> selectTags(Tag tag) {
        return tagMapper.selectTags(tag);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return tagMapper.deleteBatch(ids);
    }
}
