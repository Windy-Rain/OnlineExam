package com.exam.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 
 * Description: 使用WebMvcConfigurer来扩展SpringMvc的功能
 * @name MyMvcConfig.java
 * @author HungKuei_PC
 * @version 
 * @date 2019年5月15日
 */
@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		/*添加视图映射配置*/
		registry.addViewController("/").setViewName("index/index");
		registry.addViewController("/manager").setViewName("manager/manager");
		registry.addViewController("/kickout").setViewName("system/kickout");
	}
	
}
