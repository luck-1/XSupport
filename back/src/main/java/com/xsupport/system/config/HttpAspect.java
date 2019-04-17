package com.xsupport.system.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@Aspect
@Component
public class HttpAspect {

    private static final Logger log = LoggerFactory.getLogger(HttpAspect.class);

    @Pointcut(value = "execution(* com.xsupport.controller.*.*.*(..))")
    private void controllerAspect() {
    }

    @Before("controllerAspect()")
    public void methodBefore(JoinPoint joinPoint) {

        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        log.info("===============请求内容===============");
        log.info("请求地址:" + request.getRequestURL().toString());
        log.info("请求方式:" + request.getMethod());
        log.info("请求类方法:" + joinPoint.getSignature());
        log.info("请求类方法参数:" + Arrays.toString(joinPoint.getArgs()));
        log.info("===============请求内容===============");
    }

    @AfterReturning(returning = "returnCode", value = "controllerAspect()")
    public void methodAfter(Object returnCode) {
        log.info("===============返回内容===============");
        log.info(returnCode.toString());
        log.info("===============返回内容===============");
    }

}
