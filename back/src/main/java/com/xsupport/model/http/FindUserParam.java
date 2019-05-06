package com.xsupport.model.http;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author lxc
 * @date 2019/4/20
 * @description
 */
@Data
public class FindUserParam {

    @NotNull(message = "page不允许为空")
    private Integer page;

    @NotNull(message = "size不允许为空")
    private Integer size;

    private String name;

    private String phone;

}
