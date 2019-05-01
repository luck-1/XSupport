package com.xsupport.system.token;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author lxc
 * @date 2019/4/12
 * @description
 */
@Data
public class Token {

    @ApiModelProperty(value = "base64位签名")
    private String salt;

    @ApiModelProperty(value = "发行人名称")
    private String name;

    @ApiModelProperty(value = "保存时间")
    private int expiresSecond;

    @Override
    public String toString() {
        return "WebToken [salt=" + salt + ", name=" + name + ", expiresSecond=" + expiresSecond + "]";
    }

}
