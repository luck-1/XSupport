package com.xsupport.model.base;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Id;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 
 */
@Data
@Entity
@Table(name="user")
public class User implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value="创建时间")
    @Column(name = "createTime")
    private Date createTime;

    @ApiModelProperty(value="更新时间")
    @Column(name = "updateTime")
    private Date updateTime;

    @ApiModelProperty(value="账号")
    @Column(name = "username")
    private String username;

    @ApiModelProperty(value="密码")
    @Column(name = "password")
    private String password;

    @ApiModelProperty(value="是否管理员(1:管理员  0:普通用户)")
    @Column(name = "isAdmin")
    private int isAdmin;

    @ApiModelProperty(value="是否禁用(0:正常 1::禁用)")
    @Column(name = "isForbidden")
    private Boolean isForbidden;

    @ApiModelProperty(value="姓名")
    @Column(name = "name")
    private String name;

    @ApiModelProperty(value="性别(0:男  1:女)")
    @Column(name = "sex")
    private int sex;

    @ApiModelProperty(value="年龄")
    @Column(name = "age")
    private int age;

    @ApiModelProperty(value="家庭住址")
    @Column(name = "address")
    private String address;

    @ApiModelProperty(value="联系电话")
    @Column(name = "phone")
    private String phone;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}