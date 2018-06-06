package com.crm.gwz.crmmanager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.WebApplicationInitializer;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@ComponentScan(basePackages = {"com.crm.*"})
@MapperScan("com.crm.dao")
@EnableSwagger2
@EnableTransactionManagement
public class CrmmanagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(CrmmanagerApplication.class, args);
	}
}
