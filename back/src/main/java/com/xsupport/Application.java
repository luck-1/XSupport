package com.xsupport;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
import tk.mybatis.spring.annotation.MapperScan;

/**
 * @author lxc
 * @description 打war包必须继承 SpringBootServletInitializer 并重写 configure()
 */
@EnableSwagger2
@EnableAspectJAutoProxy
@SpringBootApplication
@MapperScan("com.xsupport.dao.base")
public class Application extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Application.class);
    }

    public static void main(String... args) {SpringApplication.run(Application.class, args);}

}