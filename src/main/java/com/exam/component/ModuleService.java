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
        	//标签
            case "tagList":
                return tagService.selectTags(new Tag());
            //友链
            case "linkList":
                Link bizLink = new Link();
                bizLink.setStatus(CoreConst.STATUS_VALID);
                return linkService.selectLinks(bizLink);
            //网站信息统计
            case "siteInfo":
                return siteInfoService.getSiteInfo();
            //网站基本信息配置
            case "sysConfig":
                return sysConfigService.selectAll();
            default:
                return null;
        }
    }
}
