package com.xsupport.model.http;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class LoginParam {

    @NotBlank(message = "用户名不能为空！")
    private String username;

    @Size(min = 4,max = 20,message = "密码长度在4到20之间")
    private String password;

}
