package com.xsupport.model.http;

import lombok.Data;
import javax.validation.constraints.Size;

@Data
public class LoginParam {

    @Size(min = 6,max = 20,message = "账号长度在6到20之间")
    private String username;

    @Size(min = 6,max = 20,message = "密码长度在6到20之间")
    private String possword;

}
