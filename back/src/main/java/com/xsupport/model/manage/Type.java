package com.xsupport.model.manage;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 各类型信息
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name="type")
public class Type implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value="创建时间")
    @Column(name = "createTime")
    private Date createTime;

    @ApiModelProperty(value="更新时间")
    @Column(name = "updateTime")
    private Date updateTime;

    @NotNull(message = "大类型不能为空")
    @ApiModelProperty(value="大类型")
    @Column(name = "bigType")
    private Integer bigType;

    @NotNull(message = "子序号不能为空")
    @ApiModelProperty(value="子序号")
    @Column(name = "subIndex")
    private Integer subIndex;

    @ApiModelProperty(value="最大值")
    @Column(name = "limitValue")
    private Float limitValue;

    @ApiModelProperty(value="名称")
    @Column(name = "name")
    private String name;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}