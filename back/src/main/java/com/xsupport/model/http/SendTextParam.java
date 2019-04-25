package com.xsupport.model.http;

import lombok.Data;

import java.util.Date;

/**
 * @author lxc
 * @date 2019/4/24
 * @description
 */
@Data
public class SendTextParam {

    private Date time;

    private String value;

}
