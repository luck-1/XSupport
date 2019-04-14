package com.xsupport.model.http;

import lombok.Data;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class PasswordParam {
    @NotBlank(message = "用户名不能为空！")
    private String id;

    @NotBlank(message = "原密码不能为空！")
    private String oldPossword;

    @Size(min = 6,max = 20,message = "新密码长度在6到20之间")
    private String newPossword;
}
