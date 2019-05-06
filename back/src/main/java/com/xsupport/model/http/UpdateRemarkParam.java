package com.xsupport.model.http;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author lxc
 * @date 2019/5/6
 * @description
 */
@Data
public class UpdateRemarkParam {

    @NotBlank(message = "ID不能为空")
    private String id;

    private String remark;


}
