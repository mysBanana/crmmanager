package com.crm.gwz.crmmanager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@ComponentScan(basePackages = {"com.crm.*"})
@MapperScan("com.crm.gwz.crmmanager")
@EnableSwagger2
public class CrmmanagerApplicationTests {

	public static void main(String[] args) {
		SpringApplication.run(CrmmanagerApplication.class, args);
	}
}
