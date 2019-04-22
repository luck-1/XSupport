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

    @NotNull(message = "pageNum不允许为空")
    private Integer pageNum;

    @NotNull(message = "pageSize不允许为空")
    private Integer pageSize;

    private String name;

    private String phone;

}
