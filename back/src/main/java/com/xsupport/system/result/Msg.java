package com.xsupport.system.result;

import lombok.Data;

/**
 * @author joker
 * @date 2019/7/22 14:48
 * @description 前后端交互标准对象封装
 */
@Data
public class Msg {

    /**
     * 返回状态码
     */
    private int code;

    /**
     * 返回状消息
     */
    private String message;

    /**
     * 返回对象
     */
    private Object obj;

    private static Msg msg = new Msg();

    private Msg() {
    }

    public static Msg success() {
        msg.setCode(0);
        msg.setMessage("成功");
        return msg;
    }

    public static Msg success(String message) {
        msg.setCode(0);
        msg.setMessage(message);
        return msg;
    }

    public static Msg success(Object obj) {
        msg.setCode(0);
        msg.setMessage("成功");
        msg.setObj(obj);
        return msg;
    }

    public static Msg success(String message, Object obj) {
        msg.setCode(0);
        msg.setMessage(message);
        msg.setObj(obj);
        return msg;
    }

    public static Msg failed() {
        msg.setCode(-1);
        msg.setMessage("失败");
        return msg;
    }

    public static Msg failed(String message) {
        msg.setCode(-1);
        msg.setMessage(message);
        return msg;
    }

    public static Msg failed(Object obj) {
        msg.setCode(-1);
        msg.setMessage("失败");
        msg.setObj(obj);
        return msg;
    }

    public static Msg failed(String message, Object obj) {
        msg.setCode(-1);
        msg.setMessage(message);
        msg.setObj(obj);
        return msg;
    }
}