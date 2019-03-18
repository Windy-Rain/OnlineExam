package com.exam.mapper;

import java.util.List;

import com.exam.model.Link;
import com.exam.util.MapperUtil;

public interface LinkMapper extends MapperUtil<Link> {

    List<Link> selectLinks(Link link);

    int deleteBatch(Integer[] ids);

}
