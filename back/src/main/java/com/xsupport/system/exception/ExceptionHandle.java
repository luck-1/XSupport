package com.xsupport.system.exception;

import com.xsupport.system.returncode.ReturnCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author klaus
 * 全局异常处理类，捕获所有来自Controller的异常，打印异常信息到日志文件中，并返回简单错误码给前端。
 * @date 创建时间：2017年12月27日 下午12:24:28
 * @version 1.0
 */
@ControllerAdvice
public class ExceptionHandle {

    private final static Logger logger = LoggerFactory.getLogger(ExceptionHandle.class);

    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public ReturnCode handle(Exception e) {
        if (e instanceof CustomException) {

            CustomException exception = (CustomException) e;
            logger.error(exception.getMessage());

            return new ReturnCode.Builder().code(exception.getCode()).msg( exception.getMessage()).build();
        } else {
            logger.error(String.format("【系统异常】{%s}", e));
            e.printStackTrace();
            return new ReturnCode.Builder().failed().msg("未知错误").build();
        }
    }
}