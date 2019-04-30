package com.xsupport.model.base;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import javax.persistence.*;
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

    @ApiModelProperty(value="类型")
    @Column(name = "bigType")
    private Integer bigType;

    @ApiModelProperty(value="子类型")
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