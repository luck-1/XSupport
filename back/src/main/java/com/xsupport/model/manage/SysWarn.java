package com.xsupport.model.manage;

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
 * @date 2019/5/1
 * @description 系统异常
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name="sys_warn")
public class SysWarn implements Serializable {
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

    @ApiModelProperty(value="修改时间")
    @Column(name = "updateTime")
    private Date updateTime;

    @ApiModelProperty(value="操作人")
    @Column(name = "optionUser")
    private String optionUser;

    @ApiModelProperty(value="异常类型（0：温度异常，1：湿度异常，2：浸润异常，3：金气异常）")
    @Column(name = "exceptionLocation")
    private Integer exceptionLocation;

    @ApiModelProperty(value="异常描述")
    @Column(name = "exceptionDescription")
    private String exceptionDescription;

    @ApiModelProperty(value="异常状态（0：未处理，1：待处理，2：正在处理，3：已处理）")
    @Column(name = "exceptionState")
    private Integer exceptionState;

    @ApiModelProperty(value="异常值")
    @Column(name = "exceptionValue")
    private String exceptionValue;

    @ApiModelProperty(value="阈值")
    @Column(name = "limitValue")
    private String limitValue;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}