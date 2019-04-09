package com.xsupport.system.run;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ReturnCode {

    @ApiModelProperty(value = "返回状态码")
    private int code;

    @ApiModelProperty(value = "消息")
    private String msg;

    @ApiModelProperty(value = "对象")
    private Object obj;

    @Override
    public String toString() {
        return "ReturnCode [code=" + code + ", msg=" + msg + ", obj=" + obj + "]";
    }

    public static class Builder {
        private ReturnCode returnCode;

        public Builder() {
            returnCode = new ReturnCode();
        }

        public Builder code(int code) {
            returnCode.setCode(code);
            return this;
        }

        public Builder msg(String msg) {
            returnCode.setMsg(msg);
            return this;
        }

        public Builder object(Object obj) {
            returnCode.setObj(obj);
            return this;
        }

        public Builder success() {
            returnCode.code = RetCodeEnum.SUCCESS.getCode();
            returnCode.msg = RetCodeEnum.SUCCESS.getMsg();
            return this;
        }

        public Builder failed() {
            returnCode.code = RetCodeEnum.FAILED.getCode();
            returnCode.msg = RetCodeEnum.FAILED.getMsg();
            return this;
        }

        public Builder paramError() {
            returnCode.code = RetCodeEnum.PARAM_ERROR.getCode();
            returnCode.msg = RetCodeEnum.PARAM_ERROR.getMsg();
            return this;
        }

        public Builder error() {
            returnCode.code = RetCodeEnum.ERROR.getCode();
            returnCode.msg = RetCodeEnum.ERROR.getMsg();
            return this;
        }

        public ReturnCode build() {
            return returnCode;
        }

    }
    public enum RetCodeEnum {

        SUCCESS(0,"成功"),
        FAILED(-1,"失败"),
        PARAM_ERROR(1,"参数异常"),
        ERROR(2,"方法异常");

        private int code;
        private String msg;

        RetCodeEnum(int code,String msg){
            this.code = code;
            this.msg = msg;
        }
        public int getCode(){
            return this.code;
        }
        public String getMsg(){
            return this.msg;
        }
    }
}
