package com.exam.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.exam.model.BizLink;
import com.exam.model.BizTags;
import com.exam.service.BizLinkService;
import com.exam.service.BizTagsService;
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
    private BizTagsService bizTagsService;
    @Autowired
    private BizLinkService bizLinkService;
    @Autowired
    private SiteInfoService siteInfoService;
    @Autowired
    private SysConfigService sysConfigService;

    public Object get(String moduleName){
        switch (moduleName){
            case "tagList":             //标签
                return bizTagsService.selectTags(new BizTags());
            case "linkList":            //友链
                BizLink bizLink = new BizLink();
                bizLink.setStatus(CoreConst.STATUS_VALID);
                return bizLinkService.selectLinks(bizLink);
            case "siteInfo":            //网站信息统计
                return siteInfoService.getSiteInfo();
            case "sysConfig":           //网站基本信息配置
                return sysConfigService.selectAll();
            default:
                return null;
        }
    }
}
