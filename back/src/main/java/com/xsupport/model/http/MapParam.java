package com.xsupport.model.http;

import lombok.Data;

/**
 * @author lxc
 * @date 2019/4/27
 * @description
 */
@Data
public class MapParam {

    private String name;

    private String value;

    public MapParam(String name,String value){
        this.name = name;
        this.value = value;
    }
}
