package com.xsupport.system.config;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * @author lxc
 * @date 2019/4/20
 * @description AOP切面类
 */
@Slf4j
@Aspect
@Component
public class HttpAspect {

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
