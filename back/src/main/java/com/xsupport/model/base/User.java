package com.xsupport.model.base;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 用户
 */
@Data
@Entity
@DynamicUpdate
@Table(name="user")
public class User implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value="创建时间")
    @Column(name = "createTime")
    private Date createTime;

    @ApiModelProperty(value="更新时间")
    @Column(name = "updateTime")
    private Date updateTime;

    @Size(min = 6,max = 20,message = "账号长度在6到20之间")
    @ApiModelProperty(value="账号")
    @Column(name = "username")
    private String username;

    @Size(min = 6,max = 20,message = "密码长度在6到20之间")
    @ApiModelProperty(value="密码")
    @Column(name = "password")
    private String password;

    @ApiModelProperty(value="是否管理员(1:管理员  0:普通用户)")
    @Column(name = "isAdmin")
    private int isAdmin;

    @ApiModelProperty(value="是否禁用(0:正常 1::禁用)")
    @Column(name = "isForbidden")
    private Boolean isForbidden;

    @NotBlank(message = "姓名不能为空！")
    @ApiModelProperty(value="姓名")
    @Column(name = "name")
    private String name;

    @ApiModelProperty(value="性别(0:男  1:女)")
    @Column(name = "sex")
    private int sex;

    @NotBlank(message = "年龄不能为空！")
    @ApiModelProperty(value="年龄")
    @Column(name = "age")
    private int age;

    @NotBlank(message = "家庭住址不能为空！")
    @ApiModelProperty(value="家庭住址")
    @Column(name = "address")
    private String address;

    @NotBlank(message = "联系电话不能为空！")
    @ApiModelProperty(value="联系电话")
    @Column(name = "phone")
    private String phone;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}