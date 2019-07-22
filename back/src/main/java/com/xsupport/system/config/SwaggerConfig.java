package com.xsupport.system.config;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author joker
 * @date 2019/7/22 17:11
 * @description swagger接口文档
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    private ApiInfo getApiInfo() {
        return new ApiInfoBuilder()
                .title("后台接口文档与测试")
                .description("这是一个给app端人员调用server端接口的测试文档与平台")
                .version("1.0")
                .termsOfServiceUrl("http://terms-of-services.url")
                .build();
    }

    private List<Parameter> getHeaderInfo() {
        ParameterBuilder parameterBuilder = new ParameterBuilder();
        parameterBuilder.name("token")
                .description("令牌")
                .modelRef(new ModelRef("string"))
                .parameterType("header")
                .required(false)
                .build();

        return Stream.of(parameterBuilder.build()).collect(Collectors.toList());
    }

    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build()
                .apiInfo(getApiInfo())
                .globalOperationParameters(getHeaderInfo());
    }
}
