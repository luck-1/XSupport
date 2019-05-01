package com.xsupport.model.http;

import lombok.Data;

/**
 * @author lxc
 * @date 2019/4/27
 * @description
 */
@Data
public class GasParam {

    private Integer subIndex;

    private Float value;

    public GasParam(Integer subIndex, Float value){
        this.subIndex = subIndex;
        this.value = value;
    }
}