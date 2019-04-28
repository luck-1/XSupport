package com.xsupport.model.http;

import lombok.Data;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author lxc
 * @date 2019/4/24
 * @description
 */
@Data
public class SendTextParam {

    private Date time;

    private String value;

    private List<MapParam> list;

    private Integer type;

    public <T> SendTextParam(T value,Integer type){
        if(value instanceof String){
            this.value = value.toString();
        }else if (value instanceof List){
            this.list = (List)value;
        }
        this.time = new Date();
        this.type = type;
    }
}
