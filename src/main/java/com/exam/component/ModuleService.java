package com.exam.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.exam.model.Link;
import com.exam.model.Tag;
import com.exam.service.LinkService;
import com.exam.service.TagService;
import com.exam.service.SiteInfoService;
import com.exam.service.SysConfigService;
import com.exam.util.CoreConst;

/**
 * js调用 thymeleaf 实现按钮权限
 * 
 */
@Component("module")
public class ModuleService {
    @Autowired
    private TagService tagService;
    @Autowired
    private LinkService linkService;
    @Autowired
    private SiteInfoService siteInfoService;
    @Autowired
    private SysConfigService sysConfigService;

    public Object get(String moduleName){
        switch (moduleName){
            case "tagList":             //标签
                return tagService.selectTags(new Tag());
            case "linkList":            //友链
                Link bizLink = new Link();
                bizLink.setStatus(CoreConst.STATUS_VALID);
                return linkService.selectLinks(bizLink);
            case "siteInfo":            //网站信息统计
                return siteInfoService.getSiteInfo();
            case "sysConfig":           //网站基本信息配置
                return sysConfigService.selectAll();
            default:
                return null;
        }
    }
}
