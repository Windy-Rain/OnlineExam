package com.exam.mapper;

import java.util.List;

import com.exam.model.Tag;
import com.exam.util.MapperUtil;

public interface TagMapper extends MapperUtil<Tag> {

    List<Tag> selectTags(Tag tag);

    int deleteBatch(Integer[] ids);
}
