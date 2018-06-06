package com.crm.config;

import com.crm.service.LogginPermissionService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.text.DateFormat;

@Configuration
public class SpringConfig  implements WebMvcConfigurer {
    @Autowired
    private Jackson2ObjectMapperBuilder jackson2ObjectMapperBuilder;
    @Autowired
    private LogginPermissionService logginPermissionService;
    /**
     * 注册 拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new PermissionHandlerInterceptor(logginPermissionService));
    }

}
