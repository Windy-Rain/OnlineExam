package com.exam.service;

import java.util.List;

import com.exam.model.Tag;

public interface TagService extends BaseService<Tag>{
	
    List<Tag> selectTags(Tag tag);

    int deleteBatch(Integer[]ids);
}
