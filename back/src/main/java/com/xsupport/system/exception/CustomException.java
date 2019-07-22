package com.xsupport.system.exception;

import com.xsupport.system.result.ReturnCode;
import lombok.Data;

/**
 * @author joker
 * @date 2019/7/22 14:56
 * @description 自定义异常
 */
@Data
public class CustomException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    private Integer code;

    public CustomException(ReturnCode returnCode) {
        super(returnCode.getMsg());
        this.code = returnCode.getCode();
    }

}
