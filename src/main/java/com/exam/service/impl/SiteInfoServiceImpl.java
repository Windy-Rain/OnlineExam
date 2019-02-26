package com.exam.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.SiteInfoMapper;
import com.exam.service.SiteInfoService;

@Service
public class SiteInfoServiceImpl implements SiteInfoService {
    @Autowired
    private SiteInfoMapper siteInfoMapper;

    @Override
    public Map<String, Object> getSiteInfo() {
        Map<String, Object> map = siteInfoMapper.getSiteInfo();
        return map;
    }

}
