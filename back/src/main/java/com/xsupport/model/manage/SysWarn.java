package com.xsupport.model.manage;

import java.util.Date;
import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonFormat;
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
@Table(name = "sys_warn")
public class SysWarn implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value = "id")
    @Column(name = "id",length = 32)
    private String id;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "记录时间")
    @Column(name = "createTime")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "更改时间")
    @Column(name = "updateTime")
    private Date updateTime;

    @ApiModelProperty(value = "操作人")
    @Column(name = "optionUser")
    private String optionUser;

    @ApiModelProperty(value = "异常定位(持久化)")
    @Column(name = "exceptionLocation")
    private Integer exceptionLocation;

    @ApiModelProperty(value = "异常类型(持久化)")
    @Column(name = "exceptionDescription")
    private Integer exceptionDescription;

    @ApiModelProperty(value = "异常状态(持久化)：（0：未处理，1：待处理，2：正在处理，3：已处理）")
    @Column(name = "exceptionState")
    private Integer exceptionState;

    @ApiModelProperty(value = "异常值(持久化)")
    @Column(name = "exceptionValue")
    private Float exceptionValue;

    @ApiModelProperty(value = "阈值(持久化)")
    @Column(name = "limitValue")
    private Float limitValue;

    @ApiModelProperty(value = "备注")
    @Column(name = "remark")
    private String remark;

    @Transient
    @ApiModelProperty(value = "异常类型")
    private String exportSubName;

    @Transient
    @ApiModelProperty(value = "异常值")
    private String exportValue;

    @Transient
    @ApiModelProperty(value = "异常状态")
    private String exportState;

    @Transient
    @ApiModelProperty(value = "阈值")
    private String exportLimitValue;

    @Transient
    @ApiModelProperty(value = "异常定位")
    private String exceptionLocationName;

    public SysWarn() {
    }

    public SysWarn(Integer exceptionLocation, Integer exceptionDescription, Float exceptionValue, Float limitValue) {
        this.exceptionLocation = exceptionLocation;
        this.exceptionDescription = exceptionDescription;
        this.exceptionValue = exceptionValue;
        this.limitValue = limitValue;
    }
}