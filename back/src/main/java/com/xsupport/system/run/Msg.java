package com.xsupport.system.run;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class Msg {

    @ApiModelProperty(value = "返回状态码")
    private int code;

    @ApiModelProperty(value = "消息")
    private String message;

    @ApiModelProperty(value = "对象")
    private Object obj;

    public static Msg seccess(){
        Msg msg = new Msg();
        msg.setCode(0);
        msg.setMessage("成功");
        return msg;
    }
    public static Msg seccess(String message){
        Msg msg = new Msg();
        msg.setCode(0);
        msg.setMessage(message);
        return msg;
    }
    public static Msg seccess(Object obj){
        Msg msg = new Msg();
        msg.setCode(0);
        msg.setMessage("成功");
        msg.setObj(obj);
        return msg;
    }
    public static Msg seccess(String message,Object obj){
        Msg msg = new Msg();
        msg.setCode(0);
        msg.setMessage(message);
        msg.setObj(obj);
        return msg;
    }

    public static Msg fild(){
        Msg msg = new Msg();
        msg.setCode(-1);
        msg.setMessage("失败");
        return msg;
    }
    public static Msg fild(String message){
        Msg msg = new Msg();
        msg.setCode(-1);
        msg.setMessage(message);
        return msg;
    }

    public static Msg fild(Object obj){
        Msg msg = new Msg();
        msg.setCode(-1);
        msg.setMessage("失败");
        msg.setObj(obj);
        return msg;
    }
    public static Msg fild(String message,Object obj){
        Msg msg = new Msg();
        msg.setCode(-1);
        msg.setMessage(message);
        msg.setObj(obj);
        return msg;
    }
}