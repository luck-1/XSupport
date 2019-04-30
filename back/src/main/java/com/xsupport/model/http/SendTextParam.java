package com.xsupport.model.http;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/24
 * @description
 */
@Data
public class SendTextParam {

    private Date time;

    private Integer value;

    private List list;

    private Integer type;

    public SendTextParam() {
    }

    public <T> SendTextParam(T value, Integer type) {
        if (value instanceof Integer) {
            this.value = (Integer) value;
        } else if (value instanceof List) {
            this.list = (List) value;
        }
        this.time = new Date();
        this.type = type;
    }
}