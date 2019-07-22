package com.xsupport.system.exception;

import com.xsupport.system.result.ReturnCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author joker
 * @date 2019/7/22 14:56
 * @description 全局异常处理类，捕获所有来自Controller的异常，打印异常信息到日志文件中，并返回简单错误码给前端。
 */
@Slf4j
@ControllerAdvice
public class ExceptionHandle {

    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public ReturnCode handle(Exception e) {
        if (e instanceof CustomException) {

            CustomException exception = (CustomException) e;
            log.error(exception.getMessage());

            return new ReturnCode.Builder().code(exception.getCode()).msg(exception.getMessage()).build();
        } else {
            log.error(String.format("【系统异常】{%s}", e));
            e.printStackTrace();
            return new ReturnCode.Builder().failed().msg("未知错误").build();
        }
    }
}