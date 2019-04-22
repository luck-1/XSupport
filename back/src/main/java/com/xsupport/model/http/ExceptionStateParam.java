package com.xsupport.model.http;

import lombok.Data;

/**
 * @author lxc
 * @date 2019/4/22
 * @description
 */
@Data
public class ExceptionStateParam {

    private String id;
    private Integer state;
    private String userId;

}
