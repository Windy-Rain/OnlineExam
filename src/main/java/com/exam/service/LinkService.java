package com.exam.service;

import java.util.List;

import com.exam.model.Link;

public interface LinkService extends BaseService<Link> {
	
    List<Link> selectLinks(Link link);

    int deleteBatch(Integer[]ids);

}
