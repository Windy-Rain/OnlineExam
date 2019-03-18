package com.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.LinkMapper;
import com.exam.model.Link;
import com.exam.service.LinkService;

@Service
public class LinkServiceImpl extends BaseServiceImpl<Link> implements LinkService  {
	
    @Autowired
    private LinkMapper linkMapper;
    
    @Override
    public List<Link>  selectLinks(Link link) {
        return linkMapper.selectLinks(link);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return linkMapper.deleteBatch(ids);
    }

}
